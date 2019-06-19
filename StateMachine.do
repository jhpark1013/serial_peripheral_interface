vlog -reportprogress 300 -work work StateMachine.v StateMachineTest.v
vsim -voptargs="+acc" StateMachineTest

add wave -position insertpoint  \
sim:/StateMachineTest/miso_bufe \
sim:/StateMachineTest/dm_we \
sim:/StateMachineTest/addr_we \
sim:/StateMachineTest/sr_we \
sim:/StateMachineTest/sclk \
sim:/StateMachineTest/cs \
sim:/StateMachineTest/rw \
sim:/StateMachineTest/UUT/counter
run -all
wave zoom full