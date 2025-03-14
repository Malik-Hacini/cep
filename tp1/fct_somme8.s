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
    somme8 : feuille
Contexte :
    i : registre t0
    res8 : mémoire, section .data
FIN DU CONTEXTE */
somme8:
somme8_fin_prologue:
    /* uint8_t i; */
    
    /* res8 = 0; */
    li t1, 0                   # Charge la valeur immédiate 0 dans t1
    la t2, res8                # Charge l'adresse de res8 dans t2
    sb t1, 0(t2)               # Stocke t1 (0) à l'adresse contenue dans t2 (sur 8 bits)
    
    /* for (i = 1; ... */
    li t0, 1                   # i = 1 (initialisation de i à 1)
    
debut_boucle:
    /* ... i <= 30; ... */
    li t3, 30                  # Charge la valeur 30 dans t3 pour la comparaison
    bgt t0, t3, fin_boucle     # Si i > 30, sortir de la boucle
    
    /* res8 = res8 + i; */
    lbu t1, 0(t2)              # Charge la valeur actuelle de res8 dans t1 (unsigned, 8 bits)
    add t1, t1, t0             # t1 = res8 + i
    sb t1, 0(t2)               # Stocke t1 dans res8 (sur 8 bits)
    
    /* ... i++) { */
    addi t0, t0, 1             # Incrémente i (i = i + 1)
    j debut_boucle             # Retour au début de la boucle
    
    /* } */
fin_boucle:
    
    /* return res8; */
    lbu a0, 0(t2)              # Charge la valeur de res8 dans a0 pour le retour (unsigned, 8 bits)
    
somme8_debut_epilogue:
    ret

    .data
    .globl res8
/* uint8_t res8;
  La variable globale res8 étant définie dans ce fichier, il est nécessaire de
  la définir dans la section .data du programme assembleur.
*/
res8:
    .byte 0                    # Réserve un octet (8 bits) initialisé à 0