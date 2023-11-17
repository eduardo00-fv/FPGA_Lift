set_property PACKAGE_PIN W5 [get_ports clk]
set_property PACKAGE_PIN L1 [get_ports piso1_led]
set_property PACKAGE_PIN P1 [get_ports piso2_led]
set_property PACKAGE_PIN N3 [get_ports piso3_led]
set_property PACKAGE_PIN P3 [get_ports piso4_led]
set_property PACKAGE_PIN U3 [get_ports piso5_led]

set_property PACKAGE_PIN W3 [get_ports piso1_up]
set_property PACKAGE_PIN V3 [get_ports piso2_up]
set_property PACKAGE_PIN V14 [get_ports piso3_up]
set_property PACKAGE_PIN U15 [get_ports piso4_up]

set_property PACKAGE_PIN V13 [get_ports piso2_down]
set_property PACKAGE_PIN U14 [get_ports piso3_down]
set_property PACKAGE_PIN W18 [get_ports piso4_down]
set_property PACKAGE_PIN V19 [get_ports piso5_down]


	
set_property PACKAGE_PIN U18 [get_ports abrir]						
	set_property IOSTANDARD LVCMOS33 [get_ports abrir]
set_property PACKAGE_PIN U17 [get_ports cerrar]						
	set_property IOSTANDARD LVCMOS33 [get_ports cerrar]
set_property PACKAGE_PIN T18 [get_ports reset]
set_property PACKAGE_PIN R2 [get_ports boton_piso_1]
set_property PACKAGE_PIN T1 [get_ports boton_piso_2]
set_property PACKAGE_PIN U1 [get_ports boton_piso_3]
set_property PACKAGE_PIN W2 [get_ports boton_piso_4]
set_property PACKAGE_PIN R3 [get_ports boton_piso_5]
set_property PACKAGE_PIN T2 [get_ports boton_subir_1]
set_property PACKAGE_PIN T3 [get_ports boton_subir_2]
set_property PACKAGE_PIN V2 [get_ports boton_bajar_2]
set_property PACKAGE_PIN W13 [get_ports boton_subir_3]
set_property PACKAGE_PIN W14 [get_ports boton_bajar_3]
set_property PACKAGE_PIN V15 [get_ports boton_subir_4]
set_property PACKAGE_PIN W15 [get_ports boton_bajar_4]
set_property PACKAGE_PIN W17 [get_ports boton_bajar_5]


set_property PACKAGE_PIN V17 [get_ports {alarma}]
set_property IOSTANDARD LVCMOS33 [get_ports {alarma}]

set_property IOSTANDARD LVCMOS33 [get_ports boton_bajar_2]
set_property IOSTANDARD LVCMOS33 [get_ports boton_bajar_3]
set_property IOSTANDARD LVCMOS33 [get_ports boton_bajar_4]
set_property IOSTANDARD LVCMOS33 [get_ports boton_bajar_5]
set_property IOSTANDARD LVCMOS33 [get_ports boton_piso_1]
set_property IOSTANDARD LVCMOS33 [get_ports boton_piso_2]
set_property IOSTANDARD LVCMOS33 [get_ports boton_piso_3]
set_property IOSTANDARD LVCMOS33 [get_ports boton_piso_4]
set_property IOSTANDARD LVCMOS33 [get_ports boton_piso_5]
set_property IOSTANDARD LVCMOS33 [get_ports boton_subir_1]
set_property IOSTANDARD LVCMOS33 [get_ports boton_subir_2]
set_property IOSTANDARD LVCMOS33 [get_ports boton_subir_3]
set_property IOSTANDARD LVCMOS33 [get_ports boton_subir_4]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports piso1_led]
set_property IOSTANDARD LVCMOS33 [get_ports piso2_led]
set_property IOSTANDARD LVCMOS33 [get_ports piso3_led]
set_property IOSTANDARD LVCMOS33 [get_ports piso4_led]
set_property IOSTANDARD LVCMOS33 [get_ports piso5_led]
set_property IOSTANDARD LVCMOS33 [get_ports piso1_up]
set_property IOSTANDARD LVCMOS33 [get_ports piso2_up]
set_property IOSTANDARD LVCMOS33 [get_ports piso3_up]
set_property IOSTANDARD LVCMOS33 [get_ports piso4_up]
set_property IOSTANDARD LVCMOS33 [get_ports piso2_down]
set_property IOSTANDARD LVCMOS33 [get_ports piso3_down]
set_property IOSTANDARD LVCMOS33 [get_ports piso4_down]
set_property IOSTANDARD LVCMOS33 [get_ports piso5_down]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]


#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN U19 [get_ports {estado_puerta[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {estado_puerta[0]}]
##Sch name = JA2
set_property PACKAGE_PIN E19 [get_ports {estado_puerta[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {estado_puerta[1]}]
##Sch name = JA3
set_property PACKAGE_PIN A14 [get_ports {LED_alarma}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_alarma}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {JA[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
set_property PACKAGE_PIN U16 [get_ports {LED_sw}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LED_sw}]
##Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {done}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {done}]
##Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]
	



