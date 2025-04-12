/*
bool palin(const char *ch)
{
    uint32_t inf, sup;
    inf = 0;
    sup = strlen(ch) - 1;
    while (inf < sup && ch[inf] == ch[sup]) {
        inf++;
        sup--;
    }
    return inf >= sup;
}
*/
    .text
    .globl palin
    .type palin, @function
    /* bool palin(char *ch) */
/* DEBUT DU CONTEXTE
Fonction :
    palin : non feuille
Contexte :
    ra      : pile *(sp+12)
    ch      : registre a0; pile *(sp+8)
    inf     : pile *(sp+4)
    sup     : pile *(sp+0)
FIN DU CONTEXTE */
palin:
    addi sp, sp, -16
    sw ra, 12(sp)

    # On stocke dans la pile
    sw a0, 8(sp)

palin_fin_prologue:
    li t0, 0              # inf = 0
    li t1, 0              # On initialise sup pour pouvoir les stocker...
    sw t0, 4(sp)
    sw t1, 0(sp)

    jal strlen            # On reccupère strleb
    lw t1, 0(sp)
    addi t1, a0, -1       # sup = strlen(ch) - 1


    # On récupère les valeurs
    lw t0, 4(sp)
    lw a0, 8(sp)          # On reccupère ch

palin_loop:
    bge t0, t1, palin_true # Si inf >= sup, la chaîne est un palindrome

    # Charger les caractères à inf et sup
    add t2, a0, t0        # t2 = adresse de ch[inf]
    lbu t2, 0(t2)         # char_inf = ch[inf]
    add t3, a0, t1        # t3 = adresse de ch[sup]
    lbu t3, 0(t3)         # char_sup = ch[sup]

    # Comparer les caractères
    bne t2, t3, palin_false # Si char_inf != char_sup, ce n'est pas un palindrome

    # Avancer inf et reculer sup
    addi t0, t0, 1        # inf++
    addi t1, t1, -1       # sup--
    j palin_loop

palin_true:
    li a0, 1              # Retourner true (1)
    j palin_debut_epilogue

palin_false:
    li a0, 0              # Retourner false (0)

palin_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
    .size palin, . - palin