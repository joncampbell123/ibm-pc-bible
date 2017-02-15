#!/bin/bash
#
# Example script to take VADLIBD.INC and dump all VADLIBD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/multimed/inc/vadlibd.inc
#file=/mnt/main/emu/win31ddk/DDK/386/include/vadlibd.inc
file=~/Downloads/x/ddk95/Inc32/VADLIBD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VADLIBD.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/vadlibd.inc
count=0

ver="4.0+"
device=0x0446

grep -R "VADLIBD_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VADLIBD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

