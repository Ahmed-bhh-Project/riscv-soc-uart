#Variables initialisées (constantes)
    .data
message: .asciz  "Au revoir...\n\r"
fin_message:
    .align 2 #aligne la section sur 2^2 octets

    .section .uart
uart_tx : .space 1    
uart_rx : .space 1    

#Programme
    .text 
    .global _start
    
_start:   
    la x10,message
    la x11,fin_message
    la x12,uart_tx

loop:    
    lb x20,0(x10)
    sb x20,0(x12)
    addi x10,x10,1
    blt x10,x11,loop
    
end:
     j end
