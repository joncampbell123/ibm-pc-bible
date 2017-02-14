#!/bin/bash
#
# Example script to take VMPoll.INC and dump all VMPoll_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/vmpoll.inc
#file=~/Downloads/x/ddk95/Inc32/VMPOLL.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/VMPOLL.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/vmpoll.inc
count=0

ver="4.90+"
device=0x0018

grep -R "VMPoll_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/VMPoll_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

