/*
uint32_t fact(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}
*/

    .text
    .globl fact
    /* uint32_t fact(uint32_t n) */
/* DEBUT DU CONTEXTE
Fonction :
    fact : non feuille
Contexte :
    ra : pile *(sp+0)
    n : registre a0; pile *(sp+4)
FIN DU CONTEXTE */
fact:
    /* Prologue: save return address and n */
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)  /* Save n as we'll need it after recursive call */
fact_fin_prologue:
    /* if (n <= 1) { */
    li t0, 1
    bgt a0, t0, else_branch
    
    /* return 1; */
    li a0, 1
    j fact_debut_epilogue
    
else_branch:
    /* Calculate n-1 */
    addi a0, a0, -1
    
    /* Recursive call: fact(n-1) */
    call fact
    
    /* Now a0 contains fact(n-1), restore n */
    lw a1, 4(sp)
    
    /* Call mult to calculate n * fact(n-1) */
    /* a0 already contains fact(n-1) */
    /* a1 already contains n */
    call mult
    /* Result is now in a0 */
    
fact_debut_epilogue:
    /* Epilogue: restore return address */
    lw ra, 0(sp)
    addi sp, sp, 8
    ret
