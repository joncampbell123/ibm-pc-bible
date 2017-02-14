#!/bin/bash
#
# Example script to take VNETBIOS.INC and dump all VNETBIOS_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vnetbios.inc
#file=~/Downloads/x/ddk95/Inc32/VNETBIOS.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VNETBIOS.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vnetbios.inc
count=0

ver="4.90+"
device=0x0014

grep -R "VNETBIOS_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VNETBIOS_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

