ifneq ($(KERNELRELEASE),)
obj-m := hello.o
else
ARCH ?= arm
CROSS_COMPILE ?= arm-none-eabi-
KDIR ?= /home/godpop/repos/linux-stable

.PHONY: all modules clean
all: modules

modules:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" ARCH="$(ARCH)" CROSS_COMPILE="$(CROSS_COMPILE)" modules

clean:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" ARCH="$(ARCH)" CROSS_COMPILE="$(CROSS_COMPILE)" clean
endif
