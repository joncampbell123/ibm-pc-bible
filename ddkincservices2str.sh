#!/bin/bash
#
# Example script to take VWIN32.INC and dump all VWIN32_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vwin32.inc
#file=~/Downloads/x/ddk95/Inc32/VWIN32.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VWIN32.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vwin32.inc
count=0

ver="4.90+"
device=0x002A

grep -R "VWIN32_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VWIN32_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

