/*
uint32_t res;

void sommeMem(void)
{
    uint32_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
}
*/

    .text
    .globl sommeMem
/* DEBUT DU CONTEXTE
Fonction :
    sommeMem : feuille
Contexte :
    i : registre t0
    res : mémoire, section .data
FIN DU CONTEXTE */
sommeMem:
sommeMem_fin_prologue:
    /* uint32_t i; */
    
    /* res = 0; */
    li t1, 0
    la t2, res
    sw t1, 0(t2)
    
    /* for (i = 1; i <= 10; i++) { */
    li t0, 1
debut_boucle:
    li t3, 10
    bgt t0, t3, fin_boucle
    
    /* res = res + i; */
    lw t1, 0(t2)
    add t1, t1, t0
    sw t1, 0(t2)
    
    /* i++ */
    addi t0, t0, 1
    j debut_boucle
    
    /* } */
fin_boucle:
sommeMem_debut_epilogue:
    ret

    .data
    .globl res
/* uint32_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
res:
    .word 0