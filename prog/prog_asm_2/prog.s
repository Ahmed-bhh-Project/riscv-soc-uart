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
    
    lb x20,0(x12)
    sb x20,0(x10)
    
    lb x20,0(x12)
    sb x20,1(x10)
    
    lb x20,0(x12)
    sb x20,2(x10)
    
    lb x20,0(x12)
    sb x20,3(x10)
    
    lb x20,0(x12)
    sb x20,4(x10)
    
    lb x20,0(x12)
    sb x20,5(x10)
    
    lb x20,0(x12)
    sb x20,6(x10)
    
    lb x20,0(x12)
    sb x20,7(x10)
    
    lb x20,0(x12)
    sb x20,8(x10)
    
    lb x20,0(x12)
    sb x20,9(x10)
    
end:
     j end
