/*
uint32_t age(uint32_t annee_naissance)
{
    uint32_t age;
    age = 2000 - annee_naissance;
    return age;
}
*/

    .text
    .globl age
    /* uint32_t age(uint32_t annee_naissance) */
/* DEBUT DU CONTEXTE
Fonction :
    age : feuille
Contexte : # contexte imposé
    annee_naissance  : registre a0
    age              : pile *(sp+0)  # de type uint32_t
FIN DU CONTEXTE */
age:
    /* Prologue: reserve space for the local variable 'age' */
    addi sp, sp, -4
age_fin_prologue:
    /* uint32_t age; */
    
    /* age = 2000 - annee_naissance; */
    li t0, 2000
    sub t0, t0, a0
    
    /* Store age on the stack as required by the context */
    sw t0, 0(sp)
    
    /* return age; */
    lw a0, 0(sp)
    
age_debut_epilogue:
    /* Epilogue: free stack space */
    addi sp, sp, 4
    ret
