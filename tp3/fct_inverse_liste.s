/*
void inverse_liste(struct cellule_t **l)
{
   struct cellule_t *res, *suiv;
   res = NULL;
   while (*l != NULL) {
       suiv = (*l)->suiv;
       (*l)->suiv = res;
       res = *l;
       *l = suiv;
   }
   *l = res;
}
*/
    .text
    .globl inverse_liste
/* void inverse_liste(struct cellule_t **l) */
/* DEBUT DU CONTEXTE
Fonction :
    inverse_liste : feuille
Contexte :
    l : registre a0
    res : registre t0
    suiv : registre t1

FIN DU CONTEXTE */
inverse_liste:
inverse_liste_fin_prologue:
    addi t0, x0, 0 # res = NULL;
boucle_tant_que:
    lw t3, 0(a0)    # t3 = *l
    beqz t3, fin_tant_que # while (*l != NULL)
    lw t1, 4(t3)            #  suiv = (*l)->suiv;
    sw t0, 4(t3)            # (*l)->suiv = res;
    addi t0, t3, 0          # res = *l;
    sw t1, 0(a0)          # *l = suiv;
    j boucle_tant_que
fin_tant_que:
    sw t0, 0(a0)          # *l = res;
inverse_liste_debut_epilogue:
    ret
