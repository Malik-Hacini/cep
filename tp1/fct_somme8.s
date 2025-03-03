/*
uint8_t res8;

uint8_t somme8(void)
{
    uint8_t i;
    res8 = 0;
    for (i = 1; i <= 30; i++) {
        res8 = res8 + i;
    }
    return res8;
}
*/

    .text
    .globl somme8
/* DEBUT DU CONTEXTE
Fonction :
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
somme8:
somme8_fin_prologue:
/* A compléter */
somme8_debut_epilogue:
    ret

    .data
    .globl res8
/* uint8_t res8;
  La variable globale res8 étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
