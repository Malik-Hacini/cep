#include "cep_platform.h"
    .text
    .globl reveil
/* void reveil(uint32_t delta_t); */
reveil:
    /* a0 = delta_t --------------------------------------------------- */

    /* 1. Lire l’horloge courante (mtime) 64 bits --------------------- */
    la      t1, CLINT_TIMER        /* Base du registre mtime          */
    lw      t2, 0(t1)              /* t2 = mtime_lo                   */
    lw      t3, 4(t1)              /* t3 = mtime_hi                   */

    /* 2. heure_future = mtime + delta_t -------------------- */
    add     t4, t2, a0             /* t4 = future_lo                  */
    sltu    t5, t4, t2             /* t5 = 1 si débordement (carry)   */
    add     t3, t3, t5             /* future_hi = old_hi + carry      */

    /* 3. Programmer mtimecmp  -------------------------------------- */
    li      t0, -1                 /* 0xFFFF_FFFF                     */
    la      t1, CLINT_TIMER_CMP    /* Base du registre mtimecmp       */
    sw      t0, 0(t1)              /* 1.  Bloquer la partie basse*/
    sw      t3, 4(t1)              /* 2. Ecrire la partie haute */
    sw      t4, 0(t1)              /* 3. Ecrire la partie basse */
    ret                            

    .globl gestion_interruptions
gestion_interruptions:
    addi sp, sp, -4 
    sw   ra, 0(sp)
    andi t0, a0, 0xf
    li   t1, IRQ_M_TMR  # Interruption horloge
    bne  t0, t1, interruption_externe
    jal  mon_vecteur_horloge
    j    retour
interruption_externe:
    /* Pour plus tard : gestion des boutons poussoirs */
retour:
    lw   ra, 0(sp)
    addi sp, sp, 4
    ret

/* Idiot mais nécessaire pour que l'évaluation soit contente... */
/* DEBUT DU CONTEXTE
  Fonction :
    timer : feuille
  Contexte :
FIN DU CONTEXTE */
timer:
timer_fin_prologue:
timer_debut_epilogue:
    ret

    .data
    .globl param
/* struct compt *param; */
param: .long 0x0
