#!/bin/bash

array=(
2048
81
atari800
bluemsx
dosbox
fbalpha2012_cps1
fbalpha2012_cps2
fbalpha2012
fbalpha2012_neogeo
fbneo
fceumm
fmsx
fuse
gambatte
gearboy
gearsystem
genesis_plus_gx
gpsp
gw
handy
mame2000
mame2003
mame2003_plus
mednafen_lynx
mednafen_ngp
mednafen_pce_fast
mednafen_supergrafx
mednafen_vb
mednafen_wswan
mgba
mu
nestopia
np2kai
nxengine
pcsx_rearmed
pokemini
prboom
prosystem
quasi88
quicknes
snes9x2002
snes9x2005
snes9x2010
squirreljme
stella2014
tgbdual
tyrquake
vba_next
vecx
vice_x128
vice_x64
vice_xplus4
vice_xvic
yabause
)

let index=0
total=${#array[@]}
for element in ${array[@]}
do
	let index=index+1
	echo "总共$total个，第$index个，$element"

	echo "cd retroarch"
	cd retroarch

	echo "make -f Makefile.vita platform=vita clean_vita"
	make -f Makefile.vita platform=vita clean_vita

	echo "cp ../dist/vita/${element}_libretro_vita.a libretro_vita.a"
	cp ../dist/vita/${element}_libretro_vita.a libretro_vita.a

	# echo "make -f Makefile.griffin platform=vita clean"
	# make -f Makefile.griffin platform=vita clean

	echo "make -f Makefile.vita platform=vita"
	make -f Makefile.vita platform=vita

	echo "cp retroarch_vita.self ../dist/vita/${element}_libretro_vita.self"
	cp retroarch_vita.self ../dist/vita/${element}_libretro_vita.self

	echo "cd .."
	cd ..
done
