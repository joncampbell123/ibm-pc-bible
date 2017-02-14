#!/bin/bash
#
# Example script to take BIOSHOOK.INC and dump all BIOSHOOK_Service enumerations
file=/mnt/main/emu/win31ddk/DDK/386/include/bioshook.inc
#file=~/Downloads/x/ddk95/Inc32/BIOSHOOK.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/BIOSHOOK.INC
#file=~/Downloads/winmeddk/NTDDK/inc/win_me/bioshook.inc
count=0

ver="3.1+"
device=0x001F

grep -R "BiosHook_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/BiosHook_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

