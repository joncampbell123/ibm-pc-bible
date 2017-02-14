#!/bin/bash
#
# Example script to take DOSMGR.INC and dump all DOSMGR_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/dosmgr.inc
#file=~/Downloads/x/ddk95/Inc32/DOSMGR.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/DOSMGR.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/dosmgr.inc
count=0

ver="4.90+"
device=0x0015

grep -R "DOSMGR_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/DOSMGR_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

