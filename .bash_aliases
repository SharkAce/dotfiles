alias updt="doas emaint sync -A && doas emerge --deep --update --newuse --quiet-build @world"
alias lsl="exa -a --git-ignore -F -1 --color=always"
alias cls="clear -x"
alias session-kill="pkill -9 -t"
alias update="doas apt update; doas apt upgrade"
alias rmdir="doas rm -r"
alias inst="doas emerge --ask --newuse --quiet-build"
alias htop="doas htop -t"
alias neo="clear ; neofetch"
alias clock="wal -R ; tty-clock -C 4 -c -b"
alias theme="clear ; python ~/github/auto-cursor-change/main.py"
alias wpm="gotta-go-fast -l"
alias pipes="~/Downloads/pipes.sh/pipes.sh"
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

#Notes
alias rubyNote="clear ; bat ~/scripts/ruby/notes.txt ; read"
alias regexNote="clear ; bat ~/notes/regex.txt ; read"
alias vimNote="clear ; bat ~/notes/vim.txt ; read"
alias todoc="todo -c"
alias todof="todo -f"

#Auto doas
alias reboot="doas reboot"
alias poweroff="doas poweroff"
alias sranger="doas ranger"
alias pacman="doas pacman"

#Git stuff
alias ups="git branch upstream ; git checkout upstream"
alias clone="git clone"

#Terminator commands
alias t="~/scripts/transparency.sh"
