/*
bool abr_est_present(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present(val, abr->fg);
   } else {
       return abr_est_present(val, abr->fd);
   }
}
*/

    .text
    .globl abr_est_present
/* DEBUT DU CONTEXTE
Fonction :
    abr_est_present : non feuille
Contexte :
    val     : registre a0; pile *(sp+4)
    abr     : registre a1; pile *(sp+0)
    ra      : pile *(sp+8)
FIN DU CONTEXTE */
abr_est_present:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 4(sp)
    sw a1, 0(sp)
abr_est_present_fin_prologue:

    beqz a1, abr_est_present_return_false

    # Charger la valeur du nœud courant (abr->val) dans t0
    lw t0, 0(a1)

    # Comparer val (a0) avec abr->val (t0)
    beq a0, t0, abr_est_present_return_true  # Si égal, retourner vrai
    blt a0, t0, abr_est_present_left         # Si val < abr->val, aller à gauche
    j abr_est_present_right                  # Sinon, aller à droite

abr_est_present_left:
    # Charger le pointeur vers le fils gauche (abr->fg) dans a1
    lw a1, 4(a1)
    # Appel récursif avec le fils gauche
    jal abr_est_present
    j abr_est_present_debut_epilogue

abr_est_present_right:
    # Charger le pointeur vers le fils droit (abr->fd) dans a1
    lw a1, 8(a1)
    # Appel récursif avec le fils droit
    jal abr_est_present
    j abr_est_present_debut_epilogue

abr_est_present_return_true:
    li a0, 1  # Retourner vrai (1)
    j abr_est_present_debut_epilogue

abr_est_present_return_false:
    li a0, 0  # Retourner faux (0)

abr_est_present_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret
