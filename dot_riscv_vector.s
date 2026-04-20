# Copyright (C) 2026 Pedro J. Martinez-Ferrer
# SPDX-License-Identifier: GPL-3.0-or-later


.section .text
.global  dot
.type    dot, @function

# double dot(const double *a, const double *b, const size_t n)
dot:
# TODO: Pas 1 - Incialització de la variable d'inducció, d'acumulació i longitud del vector
# - Inicialitza la variable d'inducció del bucle.
# - Inicialitza la variable d'acumulació.
# - Setetja el valor de la longitud del vector amb `vsetvli`.
# - Identifica què s'ha de vectoritzar.

loop_i:
# TODO: Pas 2 - Bucle vectoritzat:
# - Instruccions del bucle `i`.
# - for (i = 0; i < n; ++i) {
# - Suposarem que n és multiple de la mida del vector.
# - Pregunta: què passaria si n no fos múltiple de la mida del vector?
# - El resultat s'acumula en la variable `sum`, en un registre vectorial.
# - Quantes posicions saltem en i?
# - El resultat s'acumula en la variable `sum`, en un registre vectorial.

end_i:
# TODO: Pas 3 - Reducció del vector d'acumulació a un escalar:
# - La funció torna el resultat en el registre escalar `fa0`.
# - Abans, però, s'ha de passar d'un registre vectorial a un d'escalar.

	ret
