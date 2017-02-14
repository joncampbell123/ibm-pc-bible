#!/bin/bash
#
# Example script to take V86MMGR.INC and dump all V86MMGR_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/v86mmgr.inc
#file=~/Downloads/x/ddk95/Inc32/V86MMGR.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/V86MMGR.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/v86mmgr.inc
count=0

ver="4.90+"
device=0x0006

grep -R "V86MMGR_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/V86MMGR_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

