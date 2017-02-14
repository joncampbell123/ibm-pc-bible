#!/bin/bash
#
# Example script to take VCOMM.INC and dump all VCOMM_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vcomm.inc
#file=~/Downloads/x/ddk95/Inc32/VCOMM.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VCOMM.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vcomm.inc
count=0

ver="4.90+"
device=0x002B

grep -R "VCOMM_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VCOMM_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

