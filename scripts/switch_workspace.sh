#!/bin/bash

workspace_name="$1"
application_command="$2"

# Check if workspace allready exists
if [[ $(i3-msg -t get_workspaces | jq -e '.[] | select(.name == "'"$workspace_name"'")') ]]; then
	exist=1
fi
# Switch to the workspace
i3-msg "workspace $workspace_name"

if [[ $exist != 1 ]]; then
	i3-msg "exec --no-startup-id $application_command"
fi
