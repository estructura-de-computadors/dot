# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later


# Compilation flags
CC = riscv64-linux-gnu-gcc
CFLAGS = -static -O2 -Wall -std=c11

# Execution flags
QEMU = qemu-riscv64
QEMU_OPTS = -cpu max,v=true,vlen=128,elen=64


# All dot products
all: dot_prod_c dot_prod_scalar dot_prod_vector

run_all: run_dot_prod_c run_dot_prod_scalar run_dot_prod_vector


# C dot product 
dot_prod_c: dot_prod.c dot.c fill.c
	$(CC) $(CFLAGS) -march=rv64gc -o \
	dot_prod_c dot_prod.c dot.c fill.c -lm

run_dot_prod_c: dot_prod_c
	$(QEMU) ./dot_prod_c


# RISC-V "scalar" dot product
dot_prod_scalar: dot_prod.c dot_riscv_scalar.s fill.c
	$(CC) $(CFLAGS) -march=rv64gc -o \
	riscv64-linux-gnu-gcc -march=rv64gc -static -O2 -Wall -std=c11 -o \
	dot_prod_scalar dot_prod.c dot_riscv_scalar.s fill.c -lm

run_dot_prod_scalar: dot_prod_scalar
	$(QEMU) ./dot_prod_scalar


# RISC-V "vector" dot product
dot_prod_vector: dot_prod.c dot_riscv_vector.s fill.c
	$(CC) $(CFLAGS) -march=rv64gcv -o \
	dot_prod_vector dot_prod.c dot_riscv_vector.s fill.c -lm

run_dot_prod_vector: dot_prod_vector
	$(QEMU) $(QEMU_OPTS) ./dot_prod_vector


# Clean repository
clean:
	rm -f dot_prod_*


.PHONY: all run_dot_prod_c run_dot_prod_scalar run_dot_prod_vector clean
