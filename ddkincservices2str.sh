#!/bin/bash
#
# Example script to take BIOSXlat.INC and dump all BIOSXlat_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/biosxlat.inc
#file=~/Downloads/x/ddk95/Inc32/BIOSXLAT.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/BIOSXLAT.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/biosxlat.inc
count=0

ver="3.1+"
device=0x0013

grep -R "BIOSXlat_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/BIOSXlat_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

