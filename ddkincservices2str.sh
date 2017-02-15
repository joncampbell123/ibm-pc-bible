#!/bin/bash
#
# Example script to take IOS.INC and dump all IOS_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/ios.inc
#file=~/Downloads/x/ddk95/Inc32/IOS.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/IOS.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/ios.inc
count=0

ver="4.90+"
device=0x0010

grep -R "IOS_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/IOS_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

