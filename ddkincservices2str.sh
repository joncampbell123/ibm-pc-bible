#!/bin/bash
#
# Example script to take PAGEFILE.INC and dump all PAGEFILE_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/pagefile.inc
#file=~/Downloads/x/ddk95/Inc32/PAGEFILE.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/PAGEFILE.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/pagefile.inc
count=0

ver="4.90+"
device=0x0021

grep -R "PageFile_Service" $file | sed "s/ \+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/PageFile_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

