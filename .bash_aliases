alias update="doas emaint sync -A && doas emerge --oneshot sys-apps/portage && doas emerge --deep --update --newuse --quiet-build @world"
alias inst="doas emerge --ask --newuse --quiet-build"
alias htop="doas htop -t"
alias neo="clear ; neofetch"
alias clock="wal -R ; tty-clock -C 4 -c -b"
alias arch-speedrun="cd ~/vm ; qemu-img create -f qcow2 Image.img 3G ; time qemu-system-x86_64 -enable-kvm -boot d -drive file=Image.img -m 2G -cdrom ~/Downloads/isos/archlinux-2021.12.01-x86_64.iso -cpu host ; rm Image.img"
alias clip="xclip -selection clipboard"
alias screenshot="scrot -fs - | xclip -selection clipboard -target image/png -i"
alias ll="ls -haltr"
alias vim="nvim"
alias wttr="curl wttr.in"

#One key commands
alias q="clear ; exit"
alias c="clear"
alias h="cd ~"

#todo bind
alias todoc="todo -c"
alias todof="todo -f"

#Auto doas
alias reboot="doas reboot"
alias poweroff="doas poweroff"

#Git stuff
alias ups="git branch upstream ; git checkout upstream"
