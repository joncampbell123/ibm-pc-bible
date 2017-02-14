#!/bin/bash
#
# Example script to take CONFIGMG.INC and dump all CONFIGMG_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/configmg.inc
#file=~/Downloads/x/ddk95/Inc32/CONFIGMG.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/CONFIGMG.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/configmg.inc
count=0

ver="4.90+"
device=0x0033

grep -R "CONFIGMG_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/CONFIGMG_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

