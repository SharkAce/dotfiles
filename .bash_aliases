alias updt="doas emerge-webrsync ; doas emerge --deep --update --newuse @world"
alias agenda="calcurse"
alias lsl="exa -a --git-ignore -F -1 --color=always"
alias bat="batcat"
alias tree="exa --tree"
alias cls="clear -x"
alias session-kill="pkill -9 -t"
alias rmdir="doas rm -r"
alias inst="doas emerge --ask --newuse --quiet-build"
alias bc="bc -q"
alias htop="doas htop -t"
alias neo="clear ; neofetch"
alias ne="cd ~ ; node ~/scripts/javaScript/naruto-episode.js"
alias clock="wal -R ; tty-clock -C 4 -c -b"
alias theme="clear ; python ~/github/auto-cursor-change/main.py"
alias wpm="gotta-go-fast -l"
alias arch-speedrun="cd ~/vm ; qemu-img create -f qcow2 Image.img 3G ; time qemu-system-x86_64 -enable-kvm -boot d -drive file=Image.img -m 2G -cdrom ~/Downloads/isos/archlinux-2021.12.01-x86_64.iso -cpu host ; rm Image.img"
alias clip="xclip -selection clipboard"

#One key commands
alias q="clear ; exit"
alias c="clear"
alias h="cd ~"
alias r="wal -R"

#Auto doas
alias reboot="doas reboot"
alias shutdown="doas shutdown"
alias sranger="doas ranger"
alias pacman="doas pacman"

#Git stuff
alias ups="git branch upstream ; git checkout upstream"
alias clone="git clone"
