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
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
mult_simple_debut_epilogue:
    ret


    .data
/* uint32_t res; */
