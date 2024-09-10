#include <avr/io.h>


int main(void)
{
  DDRC = 0x1F;
	
	int a = 0x0B;
	int b = 0x0C;
	int sum = a+b;
	
	PORTC = (sum & 0x1F);
    while (1) 
    {
    }
}
