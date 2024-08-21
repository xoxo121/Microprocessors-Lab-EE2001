set_property -dict { PACKAGE_PIN N6    IOSTANDARD LVCMOS33 } [get_ports {a[0]}];#LSB
set_property -dict { PACKAGE_PIN T7    IOSTANDARD LVCMOS33 } [get_ports {a[1]}];#
set_property -dict { PACKAGE_PIN P8    IOSTANDARD LVCMOS33 } [get_ports {a[2]}];#
set_property -dict { PACKAGE_PIN M6    IOSTANDARD LVCMOS33 } [get_ports {a[3]}];#

#input b

set_property -dict { PACKAGE_PIN L5    IOSTANDARD LVCMOS33 } [get_ports {b[0]}];#LSB
set_property -dict { PACKAGE_PIN L4    IOSTANDARD LVCMOS33 } [get_ports {b[1]}];#
set_property -dict { PACKAGE_PIN M4    IOSTANDARD LVCMOS33 } [get_ports {b[2]}];#
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports {b[3]}];#

# 2x16 LCD
set_property -dict { PACKAGE_PIN P3 IOSTANDARD LVCMOS33 } [get_ports {data[7]}];
set_property -dict { PACKAGE_PIN M5 IOSTANDARD LVCMOS33 } [get_ports {data[6]}];
set_property -dict { PACKAGE_PIN N4 IOSTANDARD LVCMOS33 } [get_ports {data[5]}];
set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 } [get_ports {data[4]}];
set_property -dict { PACKAGE_PIN R1 IOSTANDARD LVCMOS33 } [get_ports {data[3]}];
set_property -dict { PACKAGE_PIN R3 IOSTANDARD LVCMOS33 } [get_ports {data[2]}];
set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS33 } [get_ports {data[1]}];
set_property -dict { PACKAGE_PIN T4 IOSTANDARD LVCMOS33 } [get_ports {data[0]}];

set_property -dict { PACKAGE_PIN T3 IOSTANDARD LVCMOS33 } [get_ports {lcd_e}];
set_property -dict { PACKAGE_PIN P5 IOSTANDARD LVCMOS33 } [get_ports {lcd_rs}];
set_property -dict { PACKAGE_PIN P4 IOSTANDARD LVCMOS33 } [get_ports {reset}];
#LCD R/W pin is connected to ground by default.No need to assign LCD R/W Pin.

set_property -dict { PACKAGE_PIN N11    IOSTANDARD LVCMOS33 } [get_ports { in_Clk }];
