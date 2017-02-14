#!/bin/bash
#
# Example script to take VMM.INC and dump all VMM_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vmm.inc
#file=~/Downloads/x/ddk95/Inc32/VMM.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VMM.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vmm.inc
count=0

ver="4.90+"
device=0x0001

grep -R "VMM_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VMM_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

