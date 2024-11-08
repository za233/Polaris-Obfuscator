#CC           = avr-gcc
#CFLAGS       = -Wall -mmcu=atmega16 -Os -Wl,-Map,test.map
#OBJCOPY      = avr-objcopy
CC           = ~/Desktop/virtualization/llvm/build/bin/clang
LD           = ~/Desktop/virtualization/llvm/build/bin/clang
AR           = ar
ARFLAGS      = rcs
CFLAGS       = -mllvm -passes=sub,bcf,fla -Wall -c
LDFLAGS      = -Wall -Wl,-Map,test.map


default: test.elf

.SILENT:
.PHONY: clean

test.o : test_compute.c
	echo [CC] $@ $(CFLAGS)
	$(CC) $(CFLAGS) -o $@ $<

uECC.o : uECC.c uECC.h
	echo [CC] $@ $(CFLAGS)
	$(CC) $(CFLAGS) -o $@ $<

test.elf : uECC.o test.o
	echo [LD] $@
	$(LD) $(LDFLAGS) -o $@ $^


clean:
	rm -f *.OBJ *.LST *.o *.gch *.out *.hex *.map *.elf *.a


