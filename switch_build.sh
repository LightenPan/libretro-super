#!/bin/bash

array=(
trampoline
gpsp
2048
4do
81
bluemsx
cannonball
cap32
crocods
desmume
dinothawr
dosbox
fbneo
fceumm
fmsx
freeintv
fuse
gambatte
gearboy
gearsystem
genesis_plus_gx
gme
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
melonds
mgba
mrboom
mu
mupen64plus_next
nestopia
np2kai
nxengine
o2em
pcsx_rearmed
picodrive
pocketcdg
pokemini
prboom
prosystem
puae
px68k
quasi88
quicknes
reminiscence
snes9x2010
snes9x2002
snes9x
squirreljme
stella2014
stella
tgbdual
theodore
tyrquake
vba_next
vecx
vice_x128
vice_x64
vice_xplus4
vice_xvic
virtualjaguar
xrick
yabause
bsnes_hd_beta
ppsspp
)

# array=(
# trampoline
# bluemsx
# dinothawr
# )

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

	# echo "make -f Makefile.libnx clean"
	# make -f Makefile.libnx clean

	echo "make -f Makefile.libnx"
	make -f Makefile.libnx

	echo "cp retroarch_switch.nro ../dist/libnx/${element}_libretro_libnx.nro"
	cp retroarch_switch.nro ../dist/libnx/${element}_libretro_libnx.nro

	echo "cd .."
	cd ..
done
