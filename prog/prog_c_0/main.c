int main(int argc, char *argv[]) {

   char *message = "Bonjour!\n";
   char *uart_tx;
   uart_tx=(char*)0x30000000;
   
   for (int i=0;i<9;i=i+1){
      *uart_tx=message[i];
   };

   return 0;
}
