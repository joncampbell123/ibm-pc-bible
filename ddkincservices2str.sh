#!/bin/bash
#
# Example script to take VPOWERD.INC and dump all VPOWERD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vpowerd.inc
#file=~/Downloads/x/ddk95/Inc32/VPOWERD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VPOWERD.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vpowerd.inc
count=0

ver="4.90+"
device=0x0026

grep -R "VPOWERD_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VPOWERD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

