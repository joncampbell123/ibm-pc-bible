#!/bin/bash
#
# Example script to take WINLOAD.INC and dump all WINLOAD_Service enumerations
file=/mnt/main/emu/win31ddk/DDK/386/include/winload.inc
#file=~/Downloads/x/ddk95/Inc32/WINLOAD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/WINLOAD.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/winload.inc
count=0

ver="3.1+"
device=0x0016

grep -R "WINLOAD_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/WINLOAD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

