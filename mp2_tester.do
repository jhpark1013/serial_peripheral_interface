vlog -reportprogress 300 -work work mp2_tester.v mp2.v spimemory.v shiftregister.v inputconditioner.v DataMemory.v addresslatch.v StateMachine.v dff.v buffer.v

vsim -voptargs="+acc" "test_mp2"
add wave -position insertpoint  \
sim:/clk \
sim:/dut/gpioBank2 \
sim:/dut/mem/dat_mem/address \
sim:/dut/mem/dat_mem/dataOut \
sim:/dut/mem/fsm/addr_we \
sim:/dut/mem/fsm/counter \
sim:/dut/mem/fsm/state \
sim:/dut/mem/addr_cap/qout \
sim:/dut/mem/shift_reg/parallelDataIn \
sim:/dut/mem/shift_reg/serialDataOut \
sim:/dut/mem/fsm/miso_bufe \
sim:/gpioBank1

run -all
wave zoom full