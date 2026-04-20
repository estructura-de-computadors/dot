# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later


.section .text
.global  dot
.type    dot, @function

# double dot(const double *a, const double *b, const size_t n)
dot:
	li      t0, 0         # i = 0
	fmv.d.x fa0, zero     # result = 0.0

loop_i:
	bgeu t0, a2, end_i    # i >= n

	slli t1, t0, 3        # i * 8
	add  t2, a0, t1       # &a[i]
	fld  ft1, 0(t2)       # a[i]

	add t2, a1, t1        # &b[i]
	fld ft2, 0(t2)        # b[i]

	fmul.d ft1, ft1, ft2  # a[i] * b[i]
	fadd.d fa0, fa0, ft1  # result += a[i] * b[i]

	addi t0, t0, 1        # i += 1
	j    loop_i

end_i:
	ret
