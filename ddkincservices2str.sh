#!/bin/bash
#
# Example script to take TSRLOAD.INC and dump all TSRLOAD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/tsrload.inc
file=~/Downloads/x/ddk95/Inc32/TSRLOAD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/TSRLOAD.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/tsrload.inc
count=0

ver="4.0+"
device=0x001E

grep -R "TSRLoad_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/TSRLoad_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

