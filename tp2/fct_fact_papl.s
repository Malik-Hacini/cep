/*
uint32_t fact_papl(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        uint64_t tmp = (uint64_t)n*fact_papl(n-1);
        if ((tmp >> 32) > 0)
            erreur_fact(n);
        return (uint32_t)tmp;
    }
}
*/

    .text
    .globl fact_papl
    /* uint32_t fact_papl(uint32_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact_papl : non feuille
Contexte :
    ra         : pile *(sp+8)
    n          : registre a0; pile *(sp+0)
    tmp         : pile *(sp+0)
FIN DU CONTEXTE */
fact_papl:
    /* on reserve la place nécessaire dans la pile */
    addi sp, sp, -16
    /* on y sauvegarde l'adresse de retour */
    sw   ra, 12(sp)
    /* Et le paramètre n */
    sw   a0, 8(sp)
fact_papl_fin_prologue:
    li t0, 1
    ble a0, t0, fact_papl_debut_epilogue # if (n <= 1){return 1;}
    addi a0, a0, -1
    jal fact_papl
    # multiplier a0 par tmp
    sw a0, 0(sp)
    lw t1, 8(sp)
    mul t2, t1, a0
    mulh t3, t1, a0
    sw t2, 0(sp)
    sw t3, 4(sp)
    bnez t3, error_check # if ((tmp >> 32) > 0)
    j no_error
error_check:
    lw a0, 8(sp)
    jal ra, erreur_fact
no_error:
    lw a0, 0(sp)

fact_papl_debut_epilogue:
    lw   ra, 12(sp)  /* on recharge ra avec l'adresse de retour de la pile */
    addi sp, sp, 16 /* on libère la pile */
    ret
