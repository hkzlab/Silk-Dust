#!/bin/bash


# All names of the tools used for accessing the disk images in the different
# platforms are defined in a single config file in the parent directory:
. ../config.sh

# Assemble the disk image for the english version of the game
cp dsk/prodos.po ./silkdust_en.po
java -jar $acjarfile -as ./silkdust_en.po SDUST.SYSTEM < silkdust_en.bin
java -jar $acjarfile -p ./silkdust_en.po EM.DRV 0 < dsk/a2e.auxmem.emd
java -jar $acjarfile -p ./silkdust_en.po TEXT.DAT 0 < text_en.dat

cp ../readme.txt .

rm *.zip
zip -r  *.po readme.txt 
cp AppleIIe_SilkDust.zip $ditdir
