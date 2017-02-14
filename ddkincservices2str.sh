#!/bin/bash
#
# Example script to take VCD.INC and dump all VCD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vcd.inc
#file=~/Downloads/x/ddk95/Inc32/VCD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VCD.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vcd.inc
count=0

ver="4.90+"
device=0x000E

grep -R "VCD_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VCD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

