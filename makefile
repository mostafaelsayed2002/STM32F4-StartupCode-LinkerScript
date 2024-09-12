CC = arm-none-eabi-gcc

MACH = cortex-m4

CFLAGS = -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall

LDFLAGS = -T STM32F4456RE_LinkerScript.ld -nostdlib -Wl,-Map=final.map

main.o: main.c
	$(CC) $(CFLAGS) $^ -o $@

RCC_program.o: RCC_program.c
	$(CC) $(CFLAGS) $^ -o $@

GPIO_program.o: GPIO_program.c
	$(CC) $(CFLAGS) $^ -o $@

STM32F446RE_Startup.o: STM32F446RE_Startup.c
	$(CC) $(CFLAGS) $^ -o $@

final.elf: main.o RCC_program.o GPIO_program.o STM32F446RE_Startup.o
	$(CC)  $(LDFLAGS) $^ -o $@

all: main.o RCC_program.o GPIO_program.o STM32F446RE_Startup.o final.elf

clean:
	rm -rf *.o *.elf *.map
