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
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
sommeMem:
sommeMem_fin_prologue:
/* A compléter */
sommeMem_debut_epilogue:
    ret

    .data
    .globl res
/* uint32_t res;
  La variable globale res étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
