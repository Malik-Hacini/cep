/*
void hello(void)
{
    affiche_HelloWorld();
}
*/

    .text
    .globl hello
    /* void hello(void) */
/*
  Pas de paramètre, Pas de variable locale.
  ra doit être sauvegardé dans la pile pour ne pas être écrasé lors de l'appel de fonction.

DEBUT DU CONTEXTE
  Fonction :
    hello : non feuille
  Contexte :
    ra  : pile *(sp+0)
FIN DU CONTEXTE */
hello:
    /* Prologue: save return address */
    addi sp, sp, -4
    sw ra, 0(sp)
hello_fin_prologue:
    /* affiche_HelloWorld(); */
    call affiche_HelloWorld
hello_debut_epilogue:
    /* Epilogue: restore return address */
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
