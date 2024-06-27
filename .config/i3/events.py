#!/usr/bin/python3

import i3ipc

def focus_new(i3, event):
    # Check if the initial focused window is in fullscreen mode
    focused = i3.get_tree().find_focused()
    if focused.fullscreen_mode == 1:
        # Toggle fullscreen off
        i3.command("fullscreen toggle")
        # Focus on the new window
        i3.command('[con_id="{}"] focus'.format(event.container.id))


def move_container (con1, con2):
    con2.command("mark __column-layout");
    con1.command("move window to mark __column-layout")
    con2.command("unmark __column-layout");

def layout (i3, event):
    if event.change == "close":
        for reply in i3.get_workspaces():
            if reply.focused:
                workspace = i3.get_tree().find_by_id(reply.ipc_data["id"]).workspace()

                if len(workspace.nodes) == 1 and len(workspace.nodes[0].nodes) == 1:
                    child = workspace.nodes[0].nodes[0]
                    move_container(child, workspace)
    else:
        window = i3.get_tree().find_by_id(event.container.id)
        if window is not None:
            workspace = window.workspace()
            if workspace is not None and len(workspace.nodes) >= 2:
                for node in workspace.nodes:
                    if node.layout != "splitv":
                        node.command("splitv")


def on_window_event(i3, e):
    focus_new(i3, e)
    layout(i3, e)

i3 = i3ipc.Connection()
i3.on("window::new", on_window_event)
i3.on("window::close", layout)
i3.on("window::move", layout)

i3.main()
