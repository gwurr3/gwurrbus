EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:pwm-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RS485 4xPWM Board"
Date "2016-09-20"
Rev "0"
Comp "WURR"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY2313A-P IC1
U 1 1 57E215F5
P 6100 3500
F 0 "IC1" H 4950 4500 50  0000 C CNN
F 1 "ATTINY2313A-P" H 7050 2600 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 6100 3500 50  0000 C CIN
F 3 "" H 6100 3500 50  0000 C CNN
	1    6100 3500
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 57E21938
P 4450 3100
F 0 "Y1" H 4450 3250 50  0000 C CNN
F 1 "Crystal" H 4450 2950 50  0000 C CNN
F 2 "Crystals:Crystal_HC52-U_Vertical" H 4450 3100 50  0001 C CNN
F 3 "" H 4450 3100 50  0000 C CNN
	1    4450 3100
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C4
U 1 1 57E2197D
P 4200 3250
F 0 "C4" H 4210 3320 50  0000 L CNN
F 1 "C_Small" H 4210 3170 50  0000 L CNN
F 2 "Choke_Axial_ThroughHole:Choke_Horizontal_RM10mm" H 4200 3250 50  0001 C CNN
F 3 "" H 4200 3250 50  0000 C CNN
	1    4200 3250
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C3
U 1 1 57E219B2
P 4200 2950
F 0 "C3" H 4210 3020 50  0000 L CNN
F 1 "C_Small" H 4210 2870 50  0000 L CNN
F 2 "Choke_Axial_ThroughHole:Choke_Horizontal_RM10mm" H 4200 2950 50  0001 C CNN
F 3 "" H 4200 2950 50  0000 C CNN
	1    4200 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4750 3200 4550 3200
Wire Wire Line
	4550 3200 4550 3250
Wire Wire Line
	4550 3250 4300 3250
Wire Wire Line
	4550 3000 4750 3000
Wire Wire Line
	4550 2950 4550 3000
Wire Wire Line
	4300 2950 4550 2950
Connection ~ 4450 2950
Connection ~ 4450 3250
Wire Wire Line
	4100 2950 4100 3250
$Comp
L GNDA #PWR01
U 1 1 57E21A42
P 4100 3050
F 0 "#PWR01" H 4100 2800 50  0001 C CNN
F 1 "GNDA" H 4100 2900 50  0000 C CNN
F 2 "" H 4100 3050 50  0000 C CNN
F 3 "" H 4100 3050 50  0000 C CNN
	1    4100 3050
	0    1    1    0   
$EndComp
Connection ~ 4100 3050
$Comp
L +5V #PWR02
U 1 1 57E21A98
P 6100 2400
F 0 "#PWR02" H 6100 2250 50  0001 C CNN
F 1 "+5V" H 6100 2540 50  0000 C CNN
F 2 "" H 6100 2400 50  0000 C CNN
F 3 "" H 6100 2400 50  0000 C CNN
	1    6100 2400
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR03
U 1 1 57E21AB4
P 6100 4500
F 0 "#PWR03" H 6100 4250 50  0001 C CNN
F 1 "GNDA" H 6100 4350 50  0000 C CNN
F 2 "" H 6100 4500 50  0000 C CNN
F 3 "" H 6100 4500 50  0000 C CNN
	1    6100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2900 7450 2900
Wire Wire Line
	7650 3000 7450 3000
Wire Wire Line
	7650 3100 7450 3100
Wire Wire Line
	7450 4100 7650 4100
$Comp
L SP3485CP U1
U 1 1 57E21DFD
P 8300 3800
F 0 "U1" H 8000 4150 50  0000 L CNN
F 1 "SP3485CP" H 8400 4150 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 8300 3800 50  0000 C CIN
F 3 "" H 8300 3800 50  0000 C CNN
	1    8300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3700 7900 3900
Wire Wire Line
	7450 3800 7900 3800
Connection ~ 7900 3800
Text Label 7650 2900 2    60   ~ 0
PWM1
Text Label 7650 3000 2    60   ~ 0
PWM2
Text Label 7650 3100 2    60   ~ 0
PWM3
Text Label 7650 4100 2    60   ~ 0
PWM4
Wire Wire Line
	7450 3700 7750 3700
Wire Wire Line
	7750 3700 7750 4000
Wire Wire Line
	7750 4000 7900 4000
Wire Wire Line
	7450 3600 7900 3600
$Comp
L GNDA #PWR04
U 1 1 57E22201
P 8300 4200
F 0 "#PWR04" H 8300 3950 50  0001 C CNN
F 1 "GNDA" H 8300 4050 50  0000 C CNN
F 2 "" H 8300 4200 50  0000 C CNN
F 3 "" H 8300 4200 50  0000 C CNN
	1    8300 4200
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 57E2221F
P 8300 3400
F 0 "#PWR05" H 8300 3250 50  0001 C CNN
F 1 "+5V" H 8300 3540 50  0000 C CNN
F 2 "" H 8300 3400 50  0000 C CNN
F 3 "" H 8300 3400 50  0000 C CNN
	1    8300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3700 8700 3700
Wire Wire Line
	8950 3900 8700 3900
Text Label 8950 3700 2    60   ~ 0
RS485A
Text Label 8950 3900 2    60   ~ 0
RS485B
$Comp
L CONN_01X02 PWRIN1
U 1 1 57E23F09
P 900 1300
F 0 "PWRIN1" H 900 1450 50  0000 C CNN
F 1 "CONN_01X02" V 1000 1300 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 900 1300 50  0001 C CNN
F 3 "" H 900 1300 50  0000 C CNN
	1    900  1300
	-1   0    0    1   
$EndComp
$Comp
L LM7805CT REG1
U 1 1 57E23F5A
P 1650 1300
F 0 "REG1" H 1450 1500 50  0000 C CNN
F 1 "LM7805CT" H 1650 1500 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 1650 1400 50  0000 C CIN
F 3 "" H 1650 1300 50  0000 C CNN
	1    1650 1300
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 57E24029
P 1250 1400
F 0 "C1" H 1275 1500 50  0000 L CNN
F 1 "1uf" H 1275 1300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 1250 1400 50  0001 C CNN
F 3 "" H 1250 1400 50  0000 C CNN
	1    1250 1400
	1    0    0    -1  
$EndComp
$Comp
L CP1 C2
U 1 1 57E24060
P 2050 1400
F 0 "C2" H 2075 1500 50  0000 L CNN
F 1 "10uf" H 2075 1300 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L6_P2.5" H 2050 1400 50  0001 C CNN
F 3 "" H 2050 1400 50  0000 C CNN
	1    2050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1250 1100 1250
$Comp
L Earth #PWR06
U 1 1 57E240E5
P 1100 1350
F 0 "#PWR06" H 1100 1100 50  0001 C CNN
F 1 "Earth" H 1100 1200 50  0001 C CNN
F 2 "" H 1100 1350 50  0000 C CNN
F 3 "" H 1100 1350 50  0000 C CNN
	1    1100 1350
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR07
U 1 1 57E24114
P 1600 1700
F 0 "#PWR07" H 1600 1450 50  0001 C CNN
F 1 "Earth" H 1600 1550 50  0001 C CNN
F 2 "" H 1600 1700 50  0000 C CNN
F 3 "" H 1600 1700 50  0000 C CNN
	1    1600 1700
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR08
U 1 1 57E24143
P 1700 1700
F 0 "#PWR08" H 1700 1450 50  0001 C CNN
F 1 "GNDA" H 1700 1550 50  0000 C CNN
F 2 "" H 1700 1700 50  0000 C CNN
F 3 "" H 1700 1700 50  0000 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1550 2050 1550
Connection ~ 1650 1550
Wire Wire Line
	1600 1700 1700 1700
Wire Wire Line
	1650 1700 1650 1550
Connection ~ 1650 1700
$Comp
L +5V #PWR09
U 1 1 57E24206
P 2050 1250
F 0 "#PWR09" H 2050 1100 50  0001 C CNN
F 1 "+5V" H 2050 1390 50  0000 C CNN
F 2 "" H 2050 1250 50  0000 C CNN
F 3 "" H 2050 1250 50  0000 C CNN
	1    2050 1250
	0    1    1    0   
$EndComp
$Comp
L IRF540N Q3
U 1 1 57E2663E
P 1650 6450
F 0 "Q3" H 1900 6525 50  0000 L CNN
F 1 "IRF540N" H 1900 6450 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 1900 6375 50  0000 L CIN
F 3 "" H 1650 6450 50  0000 L CNN
	1    1650 6450
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR010
U 1 1 57E26BE7
P 1750 6800
F 0 "#PWR010" H 1750 6550 50  0001 C CNN
F 1 "Earth" H 1750 6650 50  0001 C CNN
F 2 "" H 1750 6800 50  0000 C CNN
F 3 "" H 1750 6800 50  0000 C CNN
	1    1750 6800
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 57E26C19
P 1450 6650
F 0 "R6" V 1530 6650 50  0000 C CNN
F 1 "2.2k" V 1450 6650 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 1380 6650 50  0001 C CNN
F 3 "" H 1450 6650 50  0000 C CNN
	1    1450 6650
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 57E26CAA
P 1300 6500
F 0 "R5" V 1380 6500 50  0000 C CNN
F 1 "68R" V 1300 6500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM25mm" V 1230 6500 50  0001 C CNN
F 3 "" H 1300 6500 50  0000 C CNN
	1    1300 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 6800 1750 6650
Wire Wire Line
	1450 6800 1750 6800
Wire Wire Line
	950  6500 1150 6500
Text Label 950  6500 0    60   ~ 0
PWM3
Wire Wire Line
	2050 6250 1750 6250
Text Label 2050 6250 2    60   ~ 0
OUT3
$Comp
L IRF540N Q4
U 1 1 57E27182
P 3000 6450
F 0 "Q4" H 3250 6525 50  0000 L CNN
F 1 "IRF540N" H 3250 6450 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 3250 6375 50  0000 L CIN
F 3 "" H 3000 6450 50  0000 L CNN
	1    3000 6450
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR011
U 1 1 57E27188
P 3100 6800
F 0 "#PWR011" H 3100 6550 50  0001 C CNN
F 1 "Earth" H 3100 6650 50  0001 C CNN
F 2 "" H 3100 6800 50  0000 C CNN
F 3 "" H 3100 6800 50  0000 C CNN
	1    3100 6800
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 57E2718E
P 2800 6650
F 0 "R8" V 2880 6650 50  0000 C CNN
F 1 "2.2k" V 2800 6650 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2730 6650 50  0001 C CNN
F 3 "" H 2800 6650 50  0000 C CNN
	1    2800 6650
	-1   0    0    1   
$EndComp
$Comp
L R R7
U 1 1 57E27194
P 2650 6500
F 0 "R7" V 2730 6500 50  0000 C CNN
F 1 "68R" V 2650 6500 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM25mm" V 2580 6500 50  0001 C CNN
F 3 "" H 2650 6500 50  0000 C CNN
	1    2650 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 6800 3100 6650
Wire Wire Line
	2800 6800 3100 6800
Wire Wire Line
	2300 6500 2500 6500
Text Label 2300 6500 0    60   ~ 0
PWM4
Wire Wire Line
	3400 6250 3100 6250
Text Label 3400 6250 2    60   ~ 0
OUT4
$Comp
L IRF540N Q1
U 1 1 57E27F05
P 1650 5600
F 0 "Q1" H 1900 5675 50  0000 L CNN
F 1 "IRF540N" H 1900 5600 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 1900 5525 50  0000 L CIN
F 3 "" H 1650 5600 50  0000 L CNN
	1    1650 5600
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR012
U 1 1 57E27F0B
P 1750 5950
F 0 "#PWR012" H 1750 5700 50  0001 C CNN
F 1 "Earth" H 1750 5800 50  0001 C CNN
F 2 "" H 1750 5950 50  0000 C CNN
F 3 "" H 1750 5950 50  0000 C CNN
	1    1750 5950
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 57E27F11
P 1450 5800
F 0 "R2" V 1530 5800 50  0000 C CNN
F 1 "2.2k" V 1450 5800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 1380 5800 50  0001 C CNN
F 3 "" H 1450 5800 50  0000 C CNN
	1    1450 5800
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 57E27F17
P 1300 5650
F 0 "R1" V 1380 5650 50  0000 C CNN
F 1 "68R" V 1300 5650 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM25mm" V 1230 5650 50  0001 C CNN
F 3 "" H 1300 5650 50  0000 C CNN
	1    1300 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 5950 1750 5800
Wire Wire Line
	1450 5950 1750 5950
Wire Wire Line
	950  5650 1150 5650
Text Label 950  5650 0    60   ~ 0
PWM1
Wire Wire Line
	2050 5400 1750 5400
Text Label 2050 5400 2    60   ~ 0
OUT1
$Comp
L IRF540N Q2
U 1 1 57E27F23
P 3000 5600
F 0 "Q2" H 3250 5675 50  0000 L CNN
F 1 "IRF540N" H 3250 5600 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 3250 5525 50  0000 L CIN
F 3 "" H 3000 5600 50  0000 L CNN
	1    3000 5600
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR013
U 1 1 57E27F29
P 3100 5950
F 0 "#PWR013" H 3100 5700 50  0001 C CNN
F 1 "Earth" H 3100 5800 50  0001 C CNN
F 2 "" H 3100 5950 50  0000 C CNN
F 3 "" H 3100 5950 50  0000 C CNN
	1    3100 5950
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57E27F2F
P 2800 5800
F 0 "R4" V 2880 5800 50  0000 C CNN
F 1 "2.2k" V 2800 5800 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 2730 5800 50  0001 C CNN
F 3 "" H 2800 5800 50  0000 C CNN
	1    2800 5800
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 57E27F35
P 2650 5650
F 0 "R3" V 2730 5650 50  0000 C CNN
F 1 "68R" V 2650 5650 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM25mm" V 2580 5650 50  0001 C CNN
F 3 "" H 2650 5650 50  0000 C CNN
	1    2650 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 5950 3100 5800
Wire Wire Line
	2800 5950 3100 5950
Wire Wire Line
	2300 5650 2500 5650
Text Label 2300 5650 0    60   ~ 0
PWM2
Wire Wire Line
	3400 5400 3100 5400
Text Label 3400 5400 2    60   ~ 0
OUT2
$Comp
L CONN_01X02 OUTPWR1
U 1 1 57E301C5
P 10550 3750
F 0 "OUTPWR1" H 10550 3900 50  0000 C CNN
F 1 "CONN_01X02" V 10650 3750 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10550 3750 50  0001 C CNN
F 3 "" H 10550 3750 50  0000 C CNN
	1    10550 3750
	1    0    0    -1  
$EndComp
Connection ~ 10350 3800
$Comp
L CONN_01X02 RS485IN1
U 1 1 57E36EE4
P 10600 5450
F 0 "RS485IN1" H 10600 5600 50  0000 C CNN
F 1 "CONN_01X02" V 10700 5450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10600 5450 50  0001 C CNN
F 3 "" H 10600 5450 50  0000 C CNN
	1    10600 5450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 RS485THRU1
U 1 1 57E36F4B
P 10600 5900
F 0 "RS485THRU1" H 10600 6050 50  0000 C CNN
F 1 "CONN_01X02" V 10700 5900 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10600 5900 50  0001 C CNN
F 3 "" H 10600 5900 50  0000 C CNN
	1    10600 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5400 10400 5400
Wire Wire Line
	10150 5500 10400 5500
Wire Wire Line
	10300 5400 10300 5850
Wire Wire Line
	10300 5850 10400 5850
Connection ~ 10300 5400
Wire Wire Line
	10350 5500 10350 5950
Wire Wire Line
	10350 5950 10400 5950
Connection ~ 10350 5500
Text Label 10150 5400 0    60   ~ 0
RS485A
Text Label 10150 5500 0    60   ~ 0
RS485B
$Comp
L VCC #PWR014
U 1 1 57E3F470
P 1100 1250
F 0 "#PWR014" H 1100 1100 50  0001 C CNN
F 1 "VCC" H 1100 1400 50  0000 C CNN
F 2 "" H 1100 1250 50  0000 C CNN
F 3 "" H 1100 1250 50  0000 C CNN
	1    1100 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3200 7450 3200
Wire Wire Line
	7650 3300 7450 3300
Wire Wire Line
	4500 2700 4750 2700
Text Label 4500 2700 0    60   ~ 0
RESET
Text Label 7650 3200 2    60   ~ 0
MOSI
Text Label 7650 3300 2    60   ~ 0
MISO
Wire Wire Line
	7650 3400 7450 3400
Text Label 7650 3400 2    60   ~ 0
SCK
$Comp
L CONN_01X06 PROG1
U 1 1 57E4A2C1
P 6900 1300
F 0 "PROG1" H 6900 1500 50  0000 C CNN
F 1 "CONN_01X06" H 6900 1100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 6900 100 50  0001 C CNN
F 3 "" H 6900 100 50  0000 C CNN
	1    6900 1300
	1    0    0    -1  
$EndComp
Text Label 6400 1250 0    60   ~ 0
MISO
Text Label 6400 1150 0    60   ~ 0
SCK
Text Label 6400 1450 0    60   ~ 0
RESET
Text Label 6400 1350 0    60   ~ 0
MOSI
$Comp
L GNDA #PWR015
U 1 1 57E4ACB8
P 6700 1550
F 0 "#PWR015" H 6700 1300 50  0001 C CNN
F 1 "GNDA" H 6700 1400 50  0000 C CNN
F 2 "" H 6700 1550 50  0000 C CNN
F 3 "" H 6700 1550 50  0000 C CNN
	1    6700 1550
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR016
U 1 1 57E4AD20
P 6700 1050
F 0 "#PWR016" H 6700 900 50  0001 C CNN
F 1 "+5V" H 6700 1190 50  0000 C CNN
F 2 "" H 6700 1050 50  0000 C CNN
F 3 "" H 6700 1050 50  0000 C CNN
	1    6700 1050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 OUT1-1
U 1 1 57E61941
P 9850 750
F 0 "OUT1-1" H 9850 900 50  0000 C CNN
F 1 "CONN_01X02" V 9950 750 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 9850 750 50  0001 C CNN
F 3 "" H 9850 750 50  0000 C CNN
	1    9850 750 
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 OUT1-2
U 1 1 57E619BA
P 10500 750
F 0 "OUT1-2" H 10500 900 50  0000 C CNN
F 1 "CONN_01X02" V 10600 750 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10500 750 50  0001 C CNN
F 3 "" H 10500 750 50  0000 C CNN
	1    10500 750 
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 OUT2-1
U 1 1 57E64E7A
P 9850 1450
F 0 "OUT2-1" H 9850 1600 50  0000 C CNN
F 1 "CONN_01X02" V 9950 1450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 9850 1450 50  0001 C CNN
F 3 "" H 9850 1450 50  0000 C CNN
	1    9850 1450
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 OUT2-2
U 1 1 57E64E80
P 10500 1450
F 0 "OUT2-2" H 10500 1600 50  0000 C CNN
F 1 "CONN_01X02" V 10600 1450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10500 1450 50  0001 C CNN
F 3 "" H 10500 1450 50  0000 C CNN
	1    10500 1450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 OUT3-1
U 1 1 57E64F79
P 9850 2100
F 0 "OUT3-1" H 9850 2250 50  0000 C CNN
F 1 "CONN_01X02" V 9950 2100 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 9850 2100 50  0001 C CNN
F 3 "" H 9850 2100 50  0000 C CNN
	1    9850 2100
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 OUT3-2
U 1 1 57E64F7F
P 10500 2100
F 0 "OUT3-2" H 10500 2250 50  0000 C CNN
F 1 "CONN_01X02" V 10600 2100 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10500 2100 50  0001 C CNN
F 3 "" H 10500 2100 50  0000 C CNN
	1    10500 2100
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 OUT4-1
U 1 1 57E653F4
P 9850 2700
F 0 "OUT4-1" H 9850 2850 50  0000 C CNN
F 1 "CONN_01X02" V 9950 2700 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 9850 2700 50  0001 C CNN
F 3 "" H 9850 2700 50  0000 C CNN
	1    9850 2700
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 OUT4-2
U 1 1 57E653FA
P 10500 2700
F 0 "OUT4-2" H 10500 2850 50  0000 C CNN
F 1 "CONN_01X02" V 10600 2700 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10500 2700 50  0001 C CNN
F 3 "" H 10500 2700 50  0000 C CNN
	1    10500 2700
	1    0    0    -1  
$EndComp
Text Label 10050 700  0    60   ~ 0
OUT1
Text Label 10050 1400 0    60   ~ 0
OUT2
Text Label 10050 2050 0    60   ~ 0
OUT3
Text Label 10050 2650 0    60   ~ 0
OUT4
$Comp
L CONN_01X02 OUTPWR2
U 1 1 57E6F068
P 10150 3750
F 0 "OUTPWR2" H 10150 3900 50  0000 C CNN
F 1 "CONN_01X02" V 10250 3750 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 10150 3750 50  0001 C CNN
F 3 "" H 10150 3750 50  0000 C CNN
	1    10150 3750
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR017
U 1 1 57E74EF8
P 10350 3700
F 0 "#PWR017" H 10350 3550 50  0001 C CNN
F 1 "VCC" H 10350 3850 50  0000 C CNN
F 2 "" H 10350 3700 50  0000 C CNN
F 3 "" H 10350 3700 50  0000 C CNN
	1    10350 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 GND1
U 1 1 57E801FB
P 8150 1000
F 0 "GND1" H 8150 1150 50  0000 C CNN
F 1 "CONN_01X02" V 8250 1000 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 8150 1000 50  0001 C CNN
F 3 "" H 8150 1000 50  0000 C CNN
	1    8150 1000
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 GND2
U 1 1 57E80201
P 8150 1450
F 0 "GND2" H 8150 1600 50  0000 C CNN
F 1 "CONN_01X02" V 8250 1450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 8150 1450 50  0001 C CNN
F 3 "" H 8150 1450 50  0000 C CNN
	1    8150 1450
	-1   0    0    1   
$EndComp
$Comp
L Earth #PWR018
U 1 1 57E82EE6
P 8350 950
F 0 "#PWR018" H 8350 700 50  0001 C CNN
F 1 "Earth" H 8350 800 50  0001 C CNN
F 2 "" H 8350 950 50  0000 C CNN
F 3 "" H 8350 950 50  0000 C CNN
	1    8350 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	10050 700  10300 700 
Wire Wire Line
	10050 700  10050 800 
Wire Wire Line
	10300 700  10300 800 
Wire Wire Line
	10050 1400 10300 1400
Wire Wire Line
	10050 1500 10300 1500
Wire Wire Line
	10050 2050 10300 2050
Wire Wire Line
	10050 2150 10300 2150
Wire Wire Line
	10050 2150 10050 2050
Wire Wire Line
	10050 1400 10050 1500
Wire Wire Line
	10050 2650 10300 2650
Wire Wire Line
	10300 2650 10300 2750
Wire Wire Line
	10050 2650 10050 2750
Wire Wire Line
	8350 950  8350 1500
Connection ~ 8350 1400
Connection ~ 8350 1050
Wire Wire Line
	10350 3700 10350 3800
Wire Wire Line
	6400 1150 6700 1150
Wire Wire Line
	6700 1250 6400 1250
Wire Wire Line
	6700 1350 6400 1350
Wire Wire Line
	6700 1450 6400 1450
$Comp
L CONN_01X02 5Vout1
U 1 1 57E92130
P 3800 1100
F 0 "5Vout1" H 3800 1250 50  0000 C CNN
F 1 "CONN_01X02" V 3900 1100 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 3800 1100 50  0001 C CNN
F 3 "" H 3800 1100 50  0000 C CNN
	1    3800 1100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR019
U 1 1 57E92239
P 3600 1050
F 0 "#PWR019" H 3600 900 50  0001 C CNN
F 1 "+5V" H 3600 1190 50  0000 C CNN
F 2 "" H 3600 1050 50  0000 C CNN
F 3 "" H 3600 1050 50  0000 C CNN
	1    3600 1050
	0    -1   -1   0   
$EndComp
$Comp
L GNDA #PWR020
U 1 1 57E922BC
P 3600 1150
F 0 "#PWR020" H 3600 900 50  0001 C CNN
F 1 "GNDA" H 3600 1000 50  0000 C CNN
F 2 "" H 3600 1150 50  0000 C CNN
F 3 "" H 3600 1150 50  0000 C CNN
	1    3600 1150
	0    1    1    0   
$EndComp
$EndSCHEMATC