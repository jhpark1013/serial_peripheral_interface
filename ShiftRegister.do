vlog -reportprogress 300 -work work ShiftRegister.v 

vsim -voptargs="+acc" TestShiftRegister
add wave -position insertpoint  \
sim:/clk \
sim:/peripheralClkEdge \
sim:/parallelLoad \
sim:/parallelDataOut \
sim:/serialDataOut \
sim:/parallelDataIn \
sim:/serialDataIn \

run -all
wave zoom full