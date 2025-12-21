###############################################################################
## Clock (100 MHz onboard oscillator)
###############################################################################
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name sys_clk -period 10.000 -waveform {0 5} [get_ports clk]


###############################################################################
## Reset Button (BTNC)
###############################################################################
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]


###############################################################################
## Priority Select (SW4)
###############################################################################
set_property PACKAGE_PIN V17 [get_ports prior]
set_property IOSTANDARD LVCMOS33 [get_ports prior]


###############################################################################
## Request Inputs (SW0–SW3)
###############################################################################
set_property PACKAGE_PIN W16 [get_ports {req[0]}]
set_property PACKAGE_PIN V16 [get_ports {req[1]}]
set_property PACKAGE_PIN W17 [get_ports {req[2]}]
set_property PACKAGE_PIN W15 [get_ports {req[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {req[*]}]


###############################################################################
## Grant Outputs (LED0–LED3)
###############################################################################
set_property PACKAGE_PIN U16 [get_ports {grant[0]}]
set_property PACKAGE_PIN E19 [get_ports {grant[1]}]
set_property PACKAGE_PIN U19 [get_ports {grant[2]}]
set_property PACKAGE_PIN V19 [get_ports {grant[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {grant[*]}]
