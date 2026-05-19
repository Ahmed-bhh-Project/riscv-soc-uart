#Variables initialisées (constantes)
    .data 
vide: .space 1
    .align 2 #aligne la section sur 2^2 octets


    .bss
message_recu: .space 10
fin_message_recu:

    .section .uart
uart_rx : .space 1    
uart_tx : .space 1    

#Programme
    .text 
    .global _start
    
_start:   
    la x10,message_recu
    la x12,uart_rx
loop:
    lb x20,0(x12)
    sb x20,0(x10)
    addi x10,x10,1
    bne x20,x0,loop
end:
     j end
