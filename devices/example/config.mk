# Programming hardware: alf avr910 avrisp bascom bsd 
# dt006 pavr picoweb pony-stk200 sp12 stk200 stk500
# Type: avrdude -c ?
# to get a full listing.
AVRDUDE_PROGRAMMER = stk500v2
# serial port connected to programmer
AVRDUDE_PORT = /dev/cuaU0    
# When using avarice settings for the JTAG
JTAG_DEV = /dev/cuaU0
# MCU name
MCU = atmega328p
#MCU = atmega8515

# Adjust F_CPU below to the clock frequency in Mhz of your AVR target
# Processor frequency.
#     This will define a symbol, F_CPU, in all source code files equal to the 
#     processor frequency. You can then use this symbol in your source code to 
#     calculate timings. Do NOT tack on a 'UL' at the end, this will be done
#     automatically to create a 32-bit value in your source code.
F_CPU = 16000000
