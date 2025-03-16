/*
uint32_t x, y;  // dans la mémoire globale et allouées dans le fichier C
uint32_t res;   // dans la mémoire globale et à allouer en langage d'assemblage

uint32_t mult_simple(void)
{
    res = 0;
    while (y != 0) {
        res = res + x;
        y--;
    }
    return res;
}
*/
    .text
    .globl mult_simple
/* DEBUT DU CONTEXTE
Fonction :
    mult_simple : feuille
Contexte :
    res : registre t0
    x : mémoire #allouée par mult_simple.c
    y : mémoire #allouée par mult_simple.c
FIN DU CONTEXTE */
mult_simple:
mult_simple_fin_prologue:
    /* res = 0; */
    li t0, 0

boucle_mult:
    /* while (y != 0) { */
    la t1, y
    lw t2, 0(t1)
    beqz t2, fin_boucle_mult

    /* res = res + x; */
    la t3, x
    lw t4, 0(t3)
    add t0, t0, t4

    /* y--; */
    addi t2, t2, -1
    sw t2, 0(t1)

    j boucle_mult
fin_boucle_mult:
    /* return res; */
    mv a0, t0

mult_simple_debut_epilogue:
    ret
