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
LIBS:gwurrbus-relay-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AT90S8515-P IC1
U 1 1 57DCCFA7
P 4500 3900
F 0 "IC1" H 3650 5780 50  0000 L BNN
F 1 "AT90S8515-P" H 4950 1950 50  0000 L BNN
F 2 "Housings_DIP:DIP-40_W15.24mm" H 4500 3900 50  0000 C CIN
F 3 "" H 4500 3900 50  0000 C CNN
	1    4500 3900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 57DCD0BF
P 4150 1550
F 0 "#PWR01" H 4150 1400 50  0001 C CNN
F 1 "+5V" H 4150 1690 50  0000 C CNN
F 2 "" H 4150 1550 50  0000 C CNN
F 3 "" H 4150 1550 50  0000 C CNN
	1    4150 1550
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR02
U 1 1 57DCD147
P 4500 6250
F 0 "#PWR02" H 4500 6000 50  0001 C CNN
F 1 "GNDA" H 4500 6100 50  0000 C CNN
F 2 "" H 4500 6250 50  0000 C CNN
F 3 "" H 4500 6250 50  0000 C CNN
	1    4500 6250
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 57DCD1E2
P 3250 2850
F 0 "Y1" H 3250 3000 50  0000 C CNN
F 1 "16mhz" H 3250 2700 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 3250 2850 50  0001 C CNN
F 3 "" H 3250 2850 50  0000 C CNN
	1    3250 2850
	0    1    1    0   
$EndComp
$Comp
L C_Small C1
U 1 1 57DCD2A6
P 2900 3000
F 0 "C1" H 2910 3070 50  0000 L CNN
F 1 "C_Small" H 2910 2920 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 2900 3000 50  0001 C CNN
F 3 "" H 2900 3000 50  0000 C CNN
	1    2900 3000
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 57DCD2D3
P 2900 2700
F 0 "C2" H 2910 2770 50  0000 L CNN
F 1 "C_Small" H 2910 2620 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 2900 2700 50  0001 C CNN
F 3 "" H 2900 2700 50  0000 C CNN
	1    2900 2700
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR03
U 1 1 57DCD3CD
P 2600 2900
F 0 "#PWR03" H 2600 2650 50  0001 C CNN
F 1 "GNDA" H 2600 2750 50  0000 C CNN
F 2 "" H 2600 2900 50  0000 C CNN
F 3 "" H 2600 2900 50  0000 C CNN
	1    2600 2900
	1    0    0    -1  
$EndComp
$Comp
L SP3485CP U2
U 1 1 57DCE524
P 6800 5000
F 0 "U2" H 6500 5350 50  0000 L CNN
F 1 "SP3485CP" H 6900 5350 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm" H 6800 5000 50  0000 C CIN
F 3 "" H 6800 5000 50  0000 C CNN
	1    6800 5000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 57DCE632
P 6800 4350
F 0 "#PWR04" H 6800 4200 50  0001 C CNN
F 1 "+5V" H 6800 4490 50  0000 C CNN
F 2 "" H 6800 4350 50  0000 C CNN
F 3 "" H 6800 4350 50  0000 C CNN
	1    6800 4350
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR05
U 1 1 57DCE652
P 6800 5550
F 0 "#PWR05" H 6800 5300 50  0001 C CNN
F 1 "GNDA" H 6800 5400 50  0000 C CNN
F 2 "" H 6800 5550 50  0000 C CNN
F 3 "" H 6800 5550 50  0000 C CNN
	1    6800 5550
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 RS485
U 1 1 57DD3497
P 7750 4950
F 0 "RS485" H 7750 5100 50  0000 C CNN
F 1 "CONN_01X02" V 7850 4950 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 7750 4950 50  0001 C CNN
F 3 "" H 7750 4950 50  0000 C CNN
	1    7750 4950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 RS485S1
U 1 1 57DD34C0
P 7750 5450
F 0 "RS485S1" H 7750 5600 50  0000 C CNN
F 1 "CONN_01X02" V 7850 5450 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 7750 5450 50  0001 C CNN
F 3 "" H 7750 5450 50  0000 C CNN
	1    7750 5450
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 PROG1
U 1 1 57DD4174
P 6950 950
F 0 "PROG1" H 6950 1150 50  0000 C CNN
F 1 "CONN_02X03" H 6950 750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 6950 -250 50  0001 C CNN
F 3 "" H 6950 -250 50  0000 C CNN
	1    6950 950 
	1    0    0    -1  
$EndComp
Text Label 6400 850  0    60   ~ 0
MISO
Text Label 6450 950  0    60   ~ 0
SCK
Text Label 6400 1050 0    60   ~ 0
RESET
Text Label 7550 950  0    60   ~ 0
MOSI
$Comp
L +5V #PWR06
U 1 1 57DD4E89
P 7550 850
F 0 "#PWR06" H 7550 700 50  0001 C CNN
F 1 "+5V" H 7550 990 50  0000 C CNN
F 2 "" H 7550 850 50  0000 C CNN
F 3 "" H 7550 850 50  0000 C CNN
	1    7550 850 
	1    0    0    -1  
$EndComp
$Comp
L GNDA #PWR07
U 1 1 57DD4EAF
P 7550 1050
F 0 "#PWR07" H 7550 800 50  0001 C CNN
F 1 "GNDA" H 7550 900 50  0000 C CNN
F 2 "" H 7550 1050 50  0000 C CNN
F 3 "" H 7550 1050 50  0000 C CNN
	1    7550 1050
	1    0    0    -1  
$EndComp
Text Label 5700 3700 0    60   ~ 0
MOSI
Text Label 5700 3800 0    60   ~ 0
MISO
Text Label 5700 3900 0    60   ~ 0
SCK
Text Label 5750 2200 2    60   ~ 0
O1
Text Label 5750 2300 2    60   ~ 0
O2
Text Label 5750 2400 2    60   ~ 0
O3
Text Label 5750 2500 2    60   ~ 0
O4
Text Label 5750 2600 2    60   ~ 0
O5
Text Label 5750 2700 2    60   ~ 0
O6
Text Label 5750 2800 2    60   ~ 0
O7
Text Label 5750 2900 2    60   ~ 0
O8
Text Label 5750 4050 2    60   ~ 0
O9
Text Label 5750 4150 2    60   ~ 0
O10
Text Label 5750 4250 2    60   ~ 0
O11
Text Label 5750 4350 2    60   ~ 0
O12
Text Label 5750 4450 2    60   ~ 0
O13
Text Label 5750 4550 2    60   ~ 0
O14
Text Label 5750 4650 2    60   ~ 0
O15
Text Label 5750 4750 2    60   ~ 0
O16
$Comp
L LM7805CT U1
U 1 1 57DEE486
P 1400 6150
F 0 "U1" H 1200 6350 50  0000 C CNN
F 1 "LM7805CT" H 1400 6350 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 1400 6250 50  0000 C CIN
F 3 "" H 1400 6150 50  0000 C CNN
	1    1400 6150
	1    0    0    -1  
$EndComp
$Comp
L CP C5
U 1 1 57DEE4DA
P 1000 6250
F 0 "C5" H 1025 6350 50  0000 L CNN
F 1 "10uf" H 1025 6150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 1038 6100 50  0001 C CNN
F 3 "" H 1000 6250 50  0000 C CNN
	1    1000 6250
	1    0    0    -1  
$EndComp
$Comp
L CP C6
U 1 1 57DEE51D
P 1800 6250
F 0 "C6" H 1825 6350 50  0000 L CNN
F 1 "10uf" H 1825 6150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D5_L11_P2" H 1838 6100 50  0001 C CNN
F 3 "" H 1800 6250 50  0000 C CNN
	1    1800 6250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 57DEE67A
P 1800 6100
F 0 "#PWR08" H 1800 5950 50  0001 C CNN
F 1 "+5V" H 1800 6240 50  0000 C CNN
F 2 "" H 1800 6100 50  0000 C CNN
F 3 "" H 1800 6100 50  0000 C CNN
	1    1800 6100
	0    1    1    0   
$EndComp
$Comp
L GNDA #PWR09
U 1 1 57DEE6AA
P 1400 6400
F 0 "#PWR09" H 1400 6150 50  0001 C CNN
F 1 "GNDA" H 1400 6250 50  0000 C CNN
F 2 "" H 1400 6400 50  0000 C CNN
F 3 "" H 1400 6400 50  0000 C CNN
	1    1400 6400
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR010
U 1 1 57DEE6D8
P 1000 6100
F 0 "#PWR010" H 1000 5950 50  0001 C CNN
F 1 "+BATT" H 1000 6240 50  0000 C CNN
F 2 "" H 1000 6100 50  0000 C CNN
F 3 "" H 1000 6100 50  0000 C CNN
	1    1000 6100
	1    0    0    -1  
$EndComp
$Comp
L Earth #PWR011
U 1 1 57DEED0B
P 1200 6500
F 0 "#PWR011" H 1200 6250 50  0001 C CNN
F 1 "Earth" H 1200 6350 50  0001 C CNN
F 2 "" H 1200 6500 50  0000 C CNN
F 3 "" H 1200 6500 50  0000 C CNN
	1    1200 6500
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 PWR1
U 1 1 57DEF459
P 1000 4850
F 0 "PWR1" H 1000 5000 50  0000 C CNN
F 1 "CONN_01X02" V 1100 4850 50  0000 C CNN
F 2 "Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 1000 4850 50  0001 C CNN
F 3 "" H 1000 4850 50  0000 C CNN
	1    1000 4850
	-1   0    0    1   
$EndComp
$Comp
L +BATT #PWR012
U 1 1 57DEF603
P 1350 4800
F 0 "#PWR012" H 1350 4650 50  0001 C CNN
F 1 "+BATT" H 1350 4940 50  0000 C CNN
F 2 "" H 1350 4800 50  0000 C CNN
F 3 "" H 1350 4800 50  0000 C CNN
	1    1350 4800
	0    1    1    0   
$EndComp
$Comp
L Earth #PWR013
U 1 1 57DEF633
P 1350 4900
F 0 "#PWR013" H 1350 4650 50  0001 C CNN
F 1 "Earth" H 1350 4750 50  0001 C CNN
F 2 "" H 1350 4900 50  0000 C CNN
F 3 "" H 1350 4900 50  0000 C CNN
	1    1350 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 1900 4500 1700
Wire Wire Line
	4500 1700 4450 1700
Wire Wire Line
	4450 1700 4450 1550
Wire Wire Line
	4450 1550 4150 1550
Wire Wire Line
	3250 2700 3500 2700
Wire Wire Line
	2900 3100 3500 3100
Wire Wire Line
	3250 3000 3250 3100
Wire Wire Line
	3250 2600 3250 2700
Wire Wire Line
	2900 2600 3250 2600
Wire Wire Line
	2900 2800 2900 2900
Connection ~ 3250 3100
Wire Wire Line
	2600 2900 2600 2850
Wire Wire Line
	2600 2850 2900 2850
Connection ~ 2900 2850
Wire Wire Line
	5500 4900 6050 4900
Wire Wire Line
	6050 4900 6050 4850
Wire Wire Line
	6050 4850 6100 4850
Wire Wire Line
	6100 4850 6100 4800
Wire Wire Line
	6100 4800 6400 4800
Wire Wire Line
	5500 5000 5800 5000
Wire Wire Line
	5800 5000 5800 5050
Wire Wire Line
	5800 5050 5850 5050
Wire Wire Line
	5850 5050 5850 5100
Wire Wire Line
	5850 5100 5900 5100
Wire Wire Line
	5900 5100 5900 5150
Wire Wire Line
	5900 5150 6100 5150
Wire Wire Line
	6100 5150 6100 5200
Wire Wire Line
	6100 5200 6400 5200
Wire Wire Line
	6400 4900 6400 5100
Wire Wire Line
	5500 5100 5950 5100
Wire Wire Line
	5950 5100 5950 5050
Wire Wire Line
	5950 5050 6200 5050
Wire Wire Line
	6200 5050 6200 5000
Wire Wire Line
	6200 5000 6400 5000
Connection ~ 6400 5000
Wire Wire Line
	6800 5400 6800 5550
Wire Wire Line
	6800 4350 6800 4600
Wire Wire Line
	4500 5900 4500 6250
Wire Wire Line
	7200 4900 7550 4900
Wire Wire Line
	7550 5100 7200 5100
Wire Wire Line
	7550 5000 7550 5100
Wire Wire Line
	7450 4900 7450 5250
Wire Wire Line
	7450 5250 7500 5250
Wire Wire Line
	7500 5250 7500 5400
Wire Wire Line
	7500 5400 7550 5400
Connection ~ 7450 4900
Wire Wire Line
	7350 5100 7350 5400
Wire Wire Line
	7350 5400 7400 5400
Wire Wire Line
	7400 5400 7400 5500
Wire Wire Line
	7400 5500 7550 5500
Connection ~ 7350 5100
Wire Wire Line
	6400 850  6700 850 
Wire Wire Line
	6450 950  6700 950 
Wire Wire Line
	6400 1050 6700 1050
Wire Wire Line
	7550 850  7200 850 
Wire Wire Line
	7550 950  7200 950 
Wire Wire Line
	7550 1050 7200 1050
Wire Wire Line
	5500 3700 5700 3700
Wire Wire Line
	5700 3800 5500 3800
Wire Wire Line
	5500 3900 5700 3900
Wire Wire Line
	5500 2200 5750 2200
Wire Wire Line
	5500 2300 5750 2300
Wire Wire Line
	5750 2400 5500 2400
Wire Wire Line
	5500 2500 5750 2500
Wire Wire Line
	5500 2600 5750 2600
Wire Wire Line
	5750 2700 5500 2700
Wire Wire Line
	5750 2800 5500 2800
Wire Wire Line
	5500 2900 5750 2900
Wire Wire Line
	5750 3200 5500 3200
Wire Wire Line
	5750 3300 5500 3300
Wire Wire Line
	5750 3400 5500 3400
Wire Wire Line
	5500 3500 5750 3500
Wire Wire Line
	5500 3600 5750 3600
Wire Wire Line
	5750 4050 5500 4050
Wire Wire Line
	5750 4150 5500 4150
Wire Wire Line
	5750 4250 5500 4250
Wire Wire Line
	5750 4350 5500 4350
Wire Wire Line
	5500 4450 5750 4450
Wire Wire Line
	5500 4550 5750 4550
Wire Wire Line
	5750 4650 5500 4650
Wire Wire Line
	5750 4750 5500 4750
Wire Wire Line
	5750 5200 5500 5200
Wire Wire Line
	5750 5300 5500 5300
Wire Wire Line
	5500 5400 5750 5400
Wire Wire Line
	5750 5500 5500 5500
Wire Wire Line
	5500 5600 5750 5600
Wire Wire Line
	1000 6400 1800 6400
Connection ~ 1400 6400
Wire Wire Line
	1200 6500 1200 6400
Connection ~ 1200 6400
Wire Wire Line
	1350 4800 1200 4800
Wire Wire Line
	1350 4900 1200 4900
Wire Wire Line
	3300 2200 3500 2200
Text Label 3300 2200 0    60   ~ 0
RESET
$Comp
L CONN_01X20 P1
U 1 1 57DE2079
P 10650 2300
F 0 "P1" H 10650 3350 50  0000 C CNN
F 1 "CONN_01X20" V 10750 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x20" H 10650 2300 50  0001 C CNN
F 3 "" H 10650 2300 50  0000 C CNN
	1    10650 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1350 10450 1350
Wire Wire Line
	10200 1450 10450 1450
Wire Wire Line
	10200 1550 10450 1550
Wire Wire Line
	10200 1650 10450 1650
Wire Wire Line
	10200 1750 10450 1750
Wire Wire Line
	10200 1850 10450 1850
Wire Wire Line
	10200 1950 10450 1950
Wire Wire Line
	10200 2050 10450 2050
Wire Wire Line
	10200 2150 10450 2150
Wire Wire Line
	10200 2250 10450 2250
Wire Wire Line
	10200 2350 10450 2350
Wire Wire Line
	10200 2450 10450 2450
Wire Wire Line
	10200 2550 10450 2550
Wire Wire Line
	10200 2650 10450 2650
Wire Wire Line
	10200 2750 10450 2750
Wire Wire Line
	10200 2850 10450 2850
Wire Wire Line
	10200 2950 10450 2950
Wire Wire Line
	10200 3050 10450 3050
Wire Wire Line
	10200 3150 10450 3150
Wire Wire Line
	10200 3250 10450 3250
Text Label 10200 1350 0    60   ~ 0
O1
Text Label 10200 1450 0    60   ~ 0
O2
Text Label 10200 1550 0    60   ~ 0
O3
Text Label 10200 1650 0    60   ~ 0
O4
Text Label 10200 1750 0    60   ~ 0
O5
Text Label 10200 1850 0    60   ~ 0
O6
Text Label 10200 1950 0    60   ~ 0
O7
Text Label 10200 2050 0    60   ~ 0
O8
Text Label 10200 2750 0    60   ~ 0
O10
Text Label 10200 2850 0    60   ~ 0
O9
Text Label 10200 2650 0    60   ~ 0
O11
Text Label 10200 2550 0    60   ~ 0
O12
Text Label 10200 2450 0    60   ~ 0
O13
Text Label 10200 2350 0    60   ~ 0
O14
Text Label 10200 2250 0    60   ~ 0
O15
Text Label 10200 2150 0    60   ~ 0
O16
$Comp
L GNDA #PWR015
U 1 1 57DE2EF0
P 10200 3350
F 0 "#PWR015" H 10200 3100 50  0001 C CNN
F 1 "GNDA" H 10200 3200 50  0000 C CNN
F 2 "" H 10200 3350 50  0000 C CNN
F 3 "" H 10200 3350 50  0000 C CNN
	1    10200 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2950 10200 3350
Connection ~ 10200 3150
Connection ~ 10200 3050
Connection ~ 10200 3250
$EndSCHEMATC