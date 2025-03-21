/*
uint32_t affine(uint32_t a, uint32_t b, uint32_t x)
{
   return mult(x, a) + b;
}
*/

    .text
    .globl affine
    /* uint32_t affine(uint32_t a, uint32_t b, uint32_t x) */
/* DEBUT DU CONTEXTE
Fonction :
    affine : non feuille
Contexte :
    ra : pile *(sp+12)
    a : registre a0; pile *(sp+0)
    b : registre a1; pile *(sp+4)
    x : registre a2; pile *(sp+8)
FIN DU CONTEXTE */
affine:
    /* Prologue: save return address and b */
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a1, 4(sp)  /* Save b as we'll need it after the function call */
affine_fin_prologue:
    /* Prepare arguments for mult(x, a) */
    mv a3, a0    /* Temporarily save a */
    mv a0, a2    /* First parameter of mult is x */
    mv a1, a3    /* Second parameter of mult is a */
    
    /* call mult(x, a) */
    call mult
    
    /* Add b to the result: a0 = mult(x, a) + b */
    lw a1, 4(sp)  /* Restore b */
    add a0, a0, a1
    
affine_debut_epilogue:
    /* Epilogue: restore return address */
    lw ra, 0(sp)
    addi sp, sp, 8
    ret
