/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1 ;
        y = y >> 1;
    }
    return res;
}
*/
    .text
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
Fonction :
    mult_egypt : feuille
Contexte :
    x : mémoire #allouée par mult_egypt.c
    y : mémoire #allouée par mult_egypt.c
    res : registre t0
FIN DU CONTEXTE */
mult_egypt:
mult_egypt_fin_prologue:
    /* uint32_t res = 0; */
    li t0, 0

boucle_egypt:
    /* while (y != 0) { */
    la t1, y
    lw t2, 0(t1)
    beqz t2, fin_boucle_egypt

    /* if (y % 2 == 1) { */
    andi t3, t2, 1  # t3 = y % 2
    beqz t3, else_condition

    /* res = res + x; */
    la t4, x
    lw t5, 0(t4)
    add t0, t0, t5

else_condition:
    /* x = x << 1; */
    la t4, x
    lw t5, 0(t4)
    slli t5, t5, 1
    sw t5, 0(t4)

    /* y = y >> 1; */
    srli t2, t2, 1
    sw t2, 0(t1)

    j boucle_egypt

fin_boucle_egypt:
    /* return res; */
    mv a0, t0

mult_egypt_debut_epilogue:
    ret
