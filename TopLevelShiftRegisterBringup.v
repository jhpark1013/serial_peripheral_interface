// This is the top-level module for the project!

// Set this as the top module in Xilinx, and place all your modules within this one.

module mp2(led, gpioBank1, gpioBank2, clk, sw, btn);
output reg[7:0] led;
output reg[3:0] gpioBank1;
input[3:0] gpioBank2;
input clk;
input[7:0] sw;
input[3:0] btn;

wire neg_parallel_load;
wire cond_serial_in;
wire pos_clk_edge;
wire[7:0] led_wire;

wire dummywires[6:0];

inputconditioner button0(clk, btn[0], dummywires[0], dummywires[1], neg_parallel_load);
inputconditioner switch0(clk, sw[0], cond_serial_in, dummywires[2], dummywires[3]);
inputconditioner switch1(clk, sw[1], dummywires[4], pos_clk_edge, dummywires[5]);
reg [7:0] a5 = 165;

shiftregister s_reg(clk, pos_clk_edge, neg_parallel_load, a5, cond_serial_in, led_wire, dummywires[6]);

always @(posedge clk) begin
	led=led_wire;
	gpioBank1=gpioBank2;
end

endmodule

//Below this line is a testbench, comment if trying to synthesize.
module testmp2;
wire[7:0] led;
wire[3:0] gpioBank1;
reg[3:0] gpioBank2;
reg[3:0] btn;
reg[7:0] sw;
reg clk;
mp2 mp2_instance(led, gpioBank1, gpioBank2, clk, sw, btn);

initial clk=0;
initial btn=0;
always #10 clk=!clk;

initial begin
btn[0]=0;
sw[0]=0;
sw[1]=0;
#1000
btn[0] = 1; #1000
btn[0] = 0; #1000
$display("%b", led);
sw[0] = 0; #100
sw[1] = 1; #100
sw[1] = 0; #1000
$display("%b", led);
sw[0] = 1; #50
sw[1] = 1; #100
sw[1] = 0; #1000
$display("%b", led);
btn[0] = 0; #1000
btn[0] = 1; #1000
btn[0] = 0; #1000
$display("%b", led);

end

endmodule

