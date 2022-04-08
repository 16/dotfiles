#!/bin/sh
lock() {
    # i3lock-fancy -g -f Hack-Regular-Nerd-Font-Complete-Mono
    i3lock --color=3c3836 -i ~/Images/bg-only-lovers-left-alive-01.png --tiling
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        # lock && systemctl suspend
        systemctl suspend
        ;;
    hibernate)
        # lock && systemctl hibernate
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
