cc65_options = -O -C apple2enh-system.cfg -t apple2enh -D APPLE2E -D NCOL=80 -D CV_IS_A_FUNCTION 
aws_options  = -m -c -s -d -n -w -3 -kk -p

all: Apple2e

silkdust_no_utf8_en.c: ../../aws_sources/all_parts/silkdust.aws
	../../../aws2c $(aws_options) -R res_en.lst mapfile_en.h -f config_en_nu.h $< $@

text_en.dat: silkdust_no_utf8_en.c
	python ../../../utils/retro/res_packer.py res_en.lst text_en.dat

silkdust_en.bin: inout.c silkdust_no_utf8_en.c resource.c text_en.dat
	cl65  -DCONFIG_FILENAME=\"config_en_nu.h\" --mapfile silkdust_en.map $(cc65_options) silkdust_no_utf8_en.c inout.c loadsave.c resource.c -o $@
	

Apple2e: silkdust_en.bin

clean:
	rm silkdust_no_utf8*.c config_*_nu.h *.o *.dat *.po *.map *.bin mapfile_*.h *.lst
