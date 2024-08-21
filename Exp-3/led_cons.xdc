## To use it in a project:
## - comment the lines corresponding to unused pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project



# input a
set_property -dict { PACKAGE_PIN N6    IOSTANDARD LVCMOS33 } [get_ports {a[0]}];#LSB
set_property -dict { PACKAGE_PIN T7     IOSTANDARD LVCMOS33 } [get_ports {a[1]}];#
set_property -dict { PACKAGE_PIN P8    IOSTANDARD LVCMOS33 } [get_ports {a[2]}];#
set_property -dict { PACKAGE_PIN M6    IOSTANDARD LVCMOS33 } [get_ports {a[3]}];#

#input b

set_property -dict { PACKAGE_PIN L5    IOSTANDARD LVCMOS33 } [get_ports {b[0]}];#LSB
set_property -dict { PACKAGE_PIN L4    IOSTANDARD LVCMOS33 } [get_ports {b[1]}];#
set_property -dict { PACKAGE_PIN M4    IOSTANDARD LVCMOS33 } [get_ports {b[2]}];#
set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports {b[3]}];#

# outputs (led)
set_property -dict { PACKAGE_PIN L3    IOSTANDARD LVCMOS33 } [get_ports {m[0]}];#LSB
set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports  {m[1]}];#
set_property -dict { PACKAGE_PIN K3    IOSTANDARD LVCMOS33 } [get_ports {m[2]}];#
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports {m[3]}];#
set_property -dict { PACKAGE_PIN K5    IOSTANDARD LVCMOS33 } [get_ports {m[4]}];#
set_property -dict { PACKAGE_PIN P6    IOSTANDARD LVCMOS33 } [get_ports {m[5]}];#
set_property -dict { PACKAGE_PIN R7    IOSTANDARD LVCMOS33 } [get_ports {m[6]}];#
set_property -dict { PACKAGE_PIN R6    IOSTANDARD LVCMOS33 } [get_ports {m[7]}];#
