#!/bin/bash
#
# Example script to take VTD.INC and dump all VTD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vtd.inc
#file=~/Downloads/x/ddk95/Inc32/VTD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VTD.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vtd.inc
count=0

ver="4.90+"
device=0x0005

grep -R "VTD_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VTD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

