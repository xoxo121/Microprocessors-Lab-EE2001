#include <avr/io.h>


int main(void)
{
    	int a = 0x03;
	int b = 0x07;
	
	int sum = a+b;
	 
	DDRD = 0x07;
	PORTD = (sum & 0x07);
	
    while (1) 
    {
    }
}

