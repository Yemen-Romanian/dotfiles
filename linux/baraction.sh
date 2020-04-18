#!/bin/bash
# baraction.sh for spectrwm status bar

# This script is taken from DistroTube GitLab repository
# and modified a bit
# https://gitlab.com/dwt1/dotfiles

## DATE
dte() {
  dte="$(date +"%A, %B %d %l:%M%p")"
  echo -e "$dte"
}

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

## RAM
mem() {
  mem=`free | awk '/Mem/ {printf "%d MiB/%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "MEM: $mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU: $cpu%"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $2 }'`
    echo -e "VOL: $vol"
}

bat(){
    bat_cap=$(cat /sys/class/power_supply/BAT1/capacity)
    echo -e "BAT: $bat_cap%"
}

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do
    echo " +@fg=4; $(cpu) +@fg=0; | +@fg=1; $(mem) +@fg=0; | +@fg=5; $(hdd) | $(vol) | $(dte) | +@fg=4; $(bat)"
	sleep $SLEEP_SEC
done
