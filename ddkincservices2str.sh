#!/bin/bash
#
# Example script to take VRDSVC.INC and dump all PCCARD_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/multimed/inc/vsbd.inc
#file=/mnt/main/emu/win31ddk/DDK/386/include/vrdsvc.inc
#file=~/Downloads/x/ddk95/Inc32/PCCARD.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/PCCARD.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/pccard.inc
count=0

ver="4.90+"
device=0x097C

grep -R "PCCARD_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/PCCARD_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

