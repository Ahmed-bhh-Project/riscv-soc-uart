int main(int argc, char *argv[]) {

   char *tx_message="Bonjour!\n";

   static char rx_message[20] __attribute__((section(".bss.rxmsg")));
      
   char *uart_rx = (char*)0x30000000;
   
   char c;
   int i = 0;
   do {
      c = *uart_rx;
      rx_message[i] = c;
      i = i+1;
      // for (int t=0; t<1000; t++);
   } while ((c!=0) && (i<20));
   
   return 0;
}
