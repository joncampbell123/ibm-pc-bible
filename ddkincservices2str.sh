#!/bin/bash
#
# Example script to take VMM.INC and dump all DEBUG_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/debug.inc
#file=~/Downloads/x/ddk95/Inc32/DEBUG.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/DEBUG.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/debug.inc
count=0

ver="4.90+"
device=0x0002

grep -R "DEBUG_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/DEBUG_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

