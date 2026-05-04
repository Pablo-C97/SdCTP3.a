ARCH            = x86_64
OBJS            = main.o
TARGET          = helloworld.efi

EFIINC          = /usr/include/efi
EFIINCS         = -I$(EFIINC) -I$(EFIINC)/$(ARCH) -I$(EFIINC)/protocol
LIB             = /usr/lib
EFILIB          = /usr/lib
EFI_CRT_OBJS    = $(EFILIB)/crt0-efi-$(ARCH).o
EFI_LDS         = $(EFILIB)/elf_$(ARCH)_efi.lds

CFLAGS          = $(EFIINCS) -fpic -ffreestanding -fno-stack-protector -fno-stack-check -fshort-wchar -mno-red-zone -maccumulate-outgoing-args
LDFLAGS         = -nostdlib -znocombreloc -T $(EFI_LDS) -shared -Bsymbolic -L $(EFILIB) $(EFI_CRT_OBJS) 

all: $(TARGET)

helloworld.so: $(OBJS)
	ld $(LDFLAGS) $(OBJS) -o $@ -lefi -lgnuefi

%.efi: %.so
	objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym  -j .rel -j .rela -j .reloc --target=efi-app-$(ARCH) $^ $@

%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o *.so *.efi
