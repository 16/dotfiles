#!/bin/bash

# Retrieve custom welcome text or set to default.
startupText=${1:-"Hola !"}

# Install necesary packages.
if ! foobar_loc="$(type -p "artii")" || [[ -z $foobar_loc ]]; then
    sudo gem install artii
fi
if ! foobar_loc="$(type -p "lolcat")" || [[ -z $foobar_loc ]]; then
    sudo gem install lolcat
fi
if ! foobar_loc="$(type -p "fortune")" || [[ -z $foobar_loc ]]; then
    sudo apt install fortune
fi
if ! foobar_loc="$(type -p "cowsay")" || [[ -z $foobar_loc ]]; then
    sudo apt install cowsay
fi

# Pick a random cow
cow=(`cowsay -l | tail -n +2 | tr  " "  "\n" | sort -R | head -n 1`)

# Pick a bubble type between cowsay and cowthink
declare -a commands=("cowsay" "cowthink")
rand=$[ $RANDOM % 2 ]
command=${commands[$rand]}
randomFortune=${2-$(fortune)}

# Display startup text and cowsay with lolcat.
(artii $startupText && echo "$randomFortune" | $command -f $cow) | lolcat
