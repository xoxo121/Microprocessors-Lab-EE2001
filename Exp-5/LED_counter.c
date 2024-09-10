#include <avr/io.h>
#include <util/delay.h>


int main(void)
{
    DDRD = 0x07;
	
    while (1) 
    {
		PORTD = 0x00;
		_delay_ms(1000);
		PORTD = 0x01;
		_delay_ms(1000);
		PORTD = 0x03;
		_delay_ms(1000);
		PORTD = 0x07;
		_delay_ms(1000);
		PORTD = 0x06;
		_delay_ms(1000);
		PORTD = 0x04;
		_delay_ms(1000);
    }
}
