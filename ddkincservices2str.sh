#!/bin/bash
#
# Example script to take VFBACKUP.INC and dump all VFBACKUP_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vfbackup.inc
#file=~/Downloads/x/ddk95/Inc32/VFBACKUP.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VFBACKUP.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vfbackup.inc
count=0

ver="4.90+"
device=0x0036

grep -R "VFBACKUP_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VFBACKUP_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

