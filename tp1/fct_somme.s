/*
uint32_t somme(void)
{
    uint32_t i;
    uint32_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/

    .text
    .globl somme
/* DEBUT DU CONTEXTE
Fonction :
    somme : feuille
Contexte :
    i : registre t0
    res : registre t1
FIN DU CONTEXTE */
somme:
somme_fin_prologue:
    /* uint32_t i; */
    
    /* uint32_t res = 0 */
    li  t1, 0

/*for (i = 1; i <= 10; i++) {*/
    li t0, 1
    li   t2, 10 
for:    
    bgt  t0, t2, fin
    /* res = res + i; */
    add t1, t0, t1
    /* i++ */
    addi t0, t0, 1
    j for
    /* } */
/* return res; */
fin:
    mv a0, t1
    /* } */
somme_debut_epilogue:
    ret
