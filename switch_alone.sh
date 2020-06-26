#!/bin/bash

array=(
# bsnes_hd_beta
# snes9x2002
# dinothawr
# bluemsx
# trampoline
# fbneo
# fbalpha
# bluemsx
# dinothawr
# gpsp
ppsspp
# pcsx_rearmed
)

let index=0
total=${#array[@]}
for element in ${array[@]}
do
	let index=index+1
	echo "总共$total个，第$index个，$element"

	echo "cd retroarch"
	cd retroarch

	echo "make -f Makefile.libnx clean_switch"
	make -f Makefile.libnx clean_switch

	echo "cp ../dist/libnx/${element}_libretro_libnx.a libretro_libnx.a"
	cp ../dist/libnx/${element}_libretro_libnx.a libretro_libnx.a

	echo "make -f Makefile.libnx clean"
	make -f Makefile.libnx clean

	echo "make -f Makefile.libnx"
	make -f Makefile.libnx

	echo "cp retroarch_switch.nro ../dist/libnx/${element}_libretro_libnx.nro"
	cp retroarch_switch.nro ../dist/libnx/${element}_libretro_libnx.nro

	echo "cd .."
	cd ..
done
