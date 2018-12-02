;
; FinalWithLED.asm
;
; Created: 11/28/2018 10:25:47 AM
; Author : Mizia
;


start:
	ldi r29, 0x00
	out tcnt0, r29		;clear initial value of clk
	;set the RGB LED
	sbi ddra, 1
	sbi ddra, 2
	sbi ddra, 3
    sbi porta, 1
	sbi porta, 2
	sbi porta, 3
	
	;set sensor and buzzer
	cbi ddrb, 0		;input sensor
	sbi ddrb, 1		;ouput sensor
	sbi ddra, 0		;input buzzer
	 
loop1:
	;send sygnal to the sensor
	cbi portb, 1
	call shortDelay
	sbi portb, 1
	call notshortDelay
	cbi portb, 1

loop2:
	;wait for echo from the sensor 
	sbic pinb, 0
	rjmp one
	rjmp loop2

one:
	;start clock
	ldi r29, 0x05		;clock mode
	out tccr0b, r29		;set clk 1024 and start the clock
	loop44:
		sbis pinb, 0		;skip if high in echo is over
		rjmp two
		rjmp loop44
two:
	in r20, tcnt0		;read clock
	ldi r29, 0x00
	out tccr0b, r29		;stop clock
	out tcnt0, r29		;clear clock
	mov r27, r20		;copy clock
	lsr r27				; r27/2
	mov r31, r20		;copy clock to r31
	subi r31, 0x01		;substract 1 from r31 in order to set the negative flag
	brmi red			;if negative flag is set, turn on the red LED
	call green			;otherwise turn on the green flag
	

;generating the sound pitch
ldi r30, 0x01
loop56:
	ldi r29, 0xf0
	loop13:
		cbi porta, 0	;generating the sound
		call delay5
		sbi porta, 0	;generating the sound
		call delay5
		dec r29
		brne loop13
		dec r30
		brne loop56
		rjmp loop1		;jump to the begining, get a new clock input

shortDelay:
	ldi r19, 0x11
	   delay:
		   dec r19
		   brne delay
		   ret

notshortDelay:
	   ldi r18, 0x35
	   delay2:
		   dec r18		
		   brne delay2  
		   ret

delay5:						;depending on the clock value
	   ldi r21, 0x01
       delay_outer:
		   mov r18, r27		;copy the clock value
		   delay_inner:
			   ldi r19, 0xff
			   delay_most_inner:
				   dec r19
				   brne delay_most_inner
				   dec r18
				   brne delay_inner
				   dec r21
				   brne delay_outer
				   ret
red:
	sbi porta, 2
	cbi porta, 3
	rjmp loop1	;jump to the begining, get a new clock input, no sound gnerated
green:
	sbi porta, 3
	cbi porta, 2
	ret