#!/bin/bash
#
# Example script to take VPROD.INC and dump all VPROD_Service enumerations
file=/mnt/main/emu/win31ddk/DDK/386/include/vprod.inc
#file=~/Downloads/x/ddk95/Inc32/VPROD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VPROD.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/vprod.inc
count=0

ver="3.1+"
device=0x0019

grep -R "VPROD_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VPROD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

