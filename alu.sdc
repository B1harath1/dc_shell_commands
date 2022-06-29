create_clock -name clk -period 20 [get_ports clk]
create_clock -name I1 -period 20 [get_ports I1]
create_clock -name I2 -period 20 [get_ports I2]
create_generated_clock -source [get_ports clk] -divide 2 [get_pins ckGen/ckout] -name ckout
create_generated_clock -source [get_ports clk] -divide 2 [get_pins ckGen/ck2x] -name ck2x
#set_case_analysis 1  [get_ports TE]
set_clock_uncertainty 4 [get_clocks {clk I1 I2}]

####INPUT_DELAYS
set_input_delay 14 -clock clk [get_ports {rst a[7] a[6] a[5] a[4] a[3] a[2] a[1] a[0] b[7] b[6] b[5] b[4] b[3] b[2] b[1] b[0] c[7] c[6] c[5] c[4] c[3] c[2] c[1] c[0] d[7] d[6] d[5] d[4] d[3] d[2] d[1] d[0]}]
set_input_delay 28 -clock ckout [get_ports {TE adda[7] adda[6] adda[5] adda[4] adda[3] adda[2] adda[1] adda[0] addb[7] addb[6] addb[5] addb[4] addb[3] addb[2] addb[1] addb[0]}]
set_input_delay 14 -clock I1 [get_ports {ci si se TRI}]
set_input_delay 28 -clock ck2x [get_ports {powerDwn}]

####OUTPUT_DELAYS
set_output_delay 28 -clock ck2x [get_ports {q[15] q[14] q[13] q[12] q[11] q[10] q[9] q[8] q[7] q[6] q[5] q[4] q[3] q[2] q[1] q[0]}]
set_output_delay 14 -clock clk [get_ports {co orAll_r[7] orAll_r[6] orAll_r[5] orAll_r[4] orAll_r[3] orAll_r[2] orAll_r[1] orAll_r[0] so sumab[8] sumab[7] sumab[6] sumab[5] sumab[4] sumab[3] sumab[2] sumab[1] sumab[0] taiwan}]
 
set_input_transition 0.2 [all_inputs] 

set_load 0.30  [all_outputs]

set_max_transition 0.46 [current_design]
set_max_capacitance 0.3779706 [current_design]
