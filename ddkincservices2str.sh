#!/bin/bash
#
# Example script to take MMDEVLDR.INC and dump all MMDEVLDR_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/mmdevldr.inc
#file=~/Downloads/x/ddk95/Inc32/MMDEVLDR.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/MMDEVLDR.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/mmdevldr.inc
count=0

ver="4.90+"
device=0x044A

grep -R "MMDEVLDR_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/MMDEVLDR_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

