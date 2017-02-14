#!/bin/bash
#
# Example script to take WINDEBUG.INC and dump all WINDEBUG_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/windebug.inc
file=~/Downloads/x/ddk95/Inc32/WINDEBUG.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/WINDEBUG.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/windebug.inc
count=0

ver="4.0+"
device=0x001D

grep -R "WINDEBUG_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/WINDEBUG_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

