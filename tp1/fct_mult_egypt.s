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
    nom_de_fonction : feuille ou non feuille
Contexte :
    À compléter
FIN DU CONTEXTE */
mult_egypt:
mult_egypt_fin_prologue:
/* A compléter */
mult_egypt_debut_epilogue:
    ret
