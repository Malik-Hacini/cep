/*
uint32_t x, y;

uint32_t mult_native(void)
{
    return x*y;
}
*/
    .text
    .globl mult_native
/* DEBUT DU CONTEXTE
Fonction :
    mult_native : feuille
Contexte :
    x : mémoire #allouée dans mult_native.c
    y : mémoire #allouée dans mult_native.c
FIN DU CONTEXTE */
mult_native:
mult_native_fin_prologue:
    /* return x * y; */
    la t0, x
    lw a0, 0(t0)
    la t1, y
    lw t1, 0(t1)
    mul a0, a0, t1

mult_native_debut_epilogue:
    ret
