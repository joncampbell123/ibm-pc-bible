#!/bin/bash
#
# Example script to take VDD2.INC and dump all VDD2_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vdd2.inc
#file=~/Downloads/x/ddk95/Inc32/VDD2.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VDD2.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vdd2.inc
count=0

ver="4.90+"
device=0x001C

grep -R "VDD2_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VDD2_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

