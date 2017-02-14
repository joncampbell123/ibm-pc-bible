#!/bin/bash
#
# Example script to take VDD.INC and dump all VDD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vdd.inc
#file=~/Downloads/x/ddk95/Inc32/MINIVDD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/MINIVDD.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/minivdd.inc
count=0

ver="4.90+"
device=0x000A

grep -R "VDD_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VDD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

