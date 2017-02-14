#!/bin/bash
#
# Example script to take NDIS.INC and dump all Ndis_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/ndis.inc
#file=~/Downloads/x/ddk95/Inc32/NDIS.H
#file=~/Downloads/win98ddk/98ddk/inc/win98/NDIS.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/ndis.inc
count=0

ver="4.90+"
device=0x0028

grep -R "Ndis_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/Ndis_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

