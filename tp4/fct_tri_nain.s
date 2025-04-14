/*
void tri_nain(int32_t tab[], uint32_t taille)
{
    uint32_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int32_t tmp = tab[i];
            tab[i] = tab[i+1];
            tab[i + 1] = tmp;
            if (i > 0) {
                i = i - 1;
            }
        } else {
            i = i + 1;
        }
    }
}
*/

    .text
/*  void tri_nain(int32_t tab[], uint32_t taille) */
    .globl tri_nain
/* DEBUT DU CONTEXTE
Fonction :
    tri_nain : feuille
Contexte :
    tab : registre a0
    taille : registre a1
    i : registre a2
    tmp : registre t0
FIN DU CONTEXTE */
tri_nain:
tri_nain_fin_prologue:
mv a2, zero
while:
addi a3, a1, -1
bge a2, a3, tri_nain_debut_epilogue

/* if(tab[i] > tab([i+1]) */
/* i * 4 */
slli a3, a2, 2
/* a4 : tab[i] */
add a4, a0, a3
lw a4, 0(a4)

/* a5 : tab[i + 1] */
addi a3, a3, 4
add a5, a0, a3
lw a5, 0(a5)

bgt a4, a5, if1
addi a2, a2, 1
j while

if1:
slli a3, a2, 2
add a4, a0, a3
lw t0, 0(a4)

addi a3, a3, 4
add a5, a0, a3
lw t1, 0(a5)

sw t1, 0(a4)

sw t0, 0(a5)

ble a2, zero, while
addi a2, a2, -1

j while
tri_nain_debut_epilogue:
    ret
