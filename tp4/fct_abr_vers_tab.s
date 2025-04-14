/*
void abr_vers_tab(struct noeud_t *abr)
{
    struct noeud_t *fd;
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/

    .text
    .globl abr_vers_tab
/* DEBUT DU CONTEXTE
Fonction :
    abr_vers_tab : non feuille
Contexte :
    abr     : registre a0; pile *(sp+4)
    fd      : pile *(sp+0)
    ptr     : mémoire
    ra      : pile *(sp+8)
FIN DU CONTEXTE */
abr_vers_tab:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 4(sp)
abr_vers_tab_fin_prologue:
    beqz a0, abr_vers_tab_debut_epilogue # if (abr == NULL) return;

    # abr_vers_tab(abr->fg);
    lw t0, 4(a0)
    mv a0, t0
    jal abr_vers_tab

    lw a0, 4(sp)
    lw t0, 0(a0)      # Charger abr->val dans t0
    la t1, ptr        # Charger l'adresse de la variable globale ptr dans t1
    lw t2, 0(t1)      # Charger la valeur actuelle de ptr (adresse du tableau) dans t2
    sw t0, 0(t2)      # Stocker abr->val à l'adresse pointée par ptr
    addi t2, t2, 4    # Incrémenter ptr (passer à l'élément suivant)
    sw t2, 0(t1)      # Mettre à jour la valeur de ptr avec la nouvelle adresse

    lw t0, 8(a0)      # fd = abr->fd
    sw t0, 0(sp)
    jal free          # free(abr)

    lw a0, 0(sp)
    jal abr_vers_tab  # abr_vers_tab(fd);

abr_vers_tab_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret

.data
.global ptr      # rend ptr accessible depuis le code C
ptr: .word 0     # alloue et initialise ptr à 0
