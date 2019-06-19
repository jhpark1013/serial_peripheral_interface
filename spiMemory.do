vlog -reportprogress 300 -work work spiMemory.v shiftregister.v inputconditioner.v DataMemory.v addresslatch.v StateMachine.v dff.v buffer.v

vsim -voptargs="+acc" "testspi"
add wave -position insertpoint  \
sim:/clk

run -all
wave zoom full