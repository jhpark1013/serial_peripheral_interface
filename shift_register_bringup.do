vlog -reportprogress 300 -work work TopLevelShiftRegisterBringup.v shiftregister.v inputconditioner.v

vsim -voptargs="+acc" testmp2
add wave -position insertpoint  \
sim:/clk \
sim:/btn \
sim:/sw \
sim:/mp2_instance/button0/conditioned \
sim:/mp2_instance/button0/positiveedge \
sim:/mp2_instance/button0/negativeedge \
sim:/mp2_instance/s_reg/parallelLoad \
sim:/mp2_instance/s_reg/peripheralClkEdge \
sim:/mp2_instance/s_reg/shiftregistermem

run -all
wave zoom full