#!/bin/sh

virsh --connect qemu:///system start win10
sleep 30
echo -n Password:
read -s password
echo

xfreerdp -grab-keyboard /v:192.168.122.156 /u:jonny /p:$password /size:100% /scale-desktop:150% /dynamic-resolution /gfx-h264:avc444 +gfx-progressive &
