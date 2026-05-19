#Variables initialisées (constantes)
    .data
tab_src:  .byte 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

#Variables initialiées à zéro    
    .bss
tab_dst:  .zero 16

#Programme
    .text 
    .global _start

_start:
    addi x1,x0,16   #Chargement du décompteur de boucle
    la x10,tab_src  #Pointeur source sur tab_src
    la x11,tab_dst  #Pointeur destination sur tab_dst
loop:
    lb x12,0(x10)   #Lecture de la donnée
    sb x12,0(x11)   #Ecriture de la donnée
    addi x10,x10,1  #Incrémentation pointeur source
    addi x11,x11,1  #Incrémentation pointeur destination
    addi x1,x1,-1   #Décrémentation compteur de boucle
    bne x1,x0,loop
end:
     j end
