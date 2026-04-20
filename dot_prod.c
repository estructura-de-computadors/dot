// Copyright (C) 2026 Pedro J. Martinez-Ferrer
// SPDX-License-Identifier: GPL-3.0-or-later


#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N (200 * 1024 * 1024 / sizeof(double)) // 200 MiB per array

void fill(double *array, const size_t n);
double dot(const double *a, const double *b, const size_t n);

int main() {
  double elapsed, norm;
  double *a, *b;
  clock_t start, end;

  a = malloc(N * sizeof(double));
  b = malloc(N * sizeof(double));

  fill(a, N);
  fill(b, N);

  start = clock();
  norm = dot(a, b, N);
  end = clock();

  norm = sqrt(fabs(norm));
  elapsed = (double)(end - start) / CLOCKS_PER_SEC;
  printf("dot product norm = %.6e, time = %.6e seconds\n", norm, elapsed);

  free(a);
  free(b);

  return 0;
}
