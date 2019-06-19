vlog -reportprogress 300 -work work inputconditioner.v shiftregister.v

vsim -voptargs="+acc" testConditioner
add wave -position insertpoint  \
sim:/testConditioner/clk \
sim:/testConditioner/pin \
sim:/testConditioner/conditioned \
sim:/dut/synchronizer0 \
sim:/dut/synchronizer1 \
sim:/dut/counter \
sim:/testConditioner/rising \
sim:/testConditioner/falling 
run -all

wave zoom full