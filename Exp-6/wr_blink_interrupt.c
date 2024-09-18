#define F_CPU 8000000UL
#include <avr/io.h>
#include<util/delay.h>
#include <avr/interrupt.h>
int main(void)
{
	DDRB=0x03;
	DDRD=0x00;
	GICR=0x40;
	SREG=0x80;
	while(1)
	{
		PORTB=0x01;
	}
}
ISR(INT0_vect)
{
	cli();
	PORTB=0x02;
	_delay_ms(100);
	PORTB=0x00;
	_delay_ms(100);
	sei();
}

