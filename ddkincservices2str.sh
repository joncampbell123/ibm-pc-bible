#!/bin/bash
#
# Example script to take BLOCKDEV.INC and dump all BlockDev_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/blockdev.inc
#file=~/Downloads/x/ddk95/Inc32/BLOCKDEV.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/BLOCKDEV.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/blockdev.inc
count=0

ver="4.90+"
device=0x0010

grep -R "BlockDev_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/BlockDev_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

