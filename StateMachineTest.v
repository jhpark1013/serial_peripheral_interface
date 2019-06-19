module StateMachineTest;
	reg sclk, cs, rw;
	wire miso_bufe, dm_we, addr_we, sr_we;
StateMachine UUT(miso_bufe, dm_we, addr_we, sr_we, sclk, cs, rw);
	initial begin
		//cycle test
	$display("Write Cycle tests");
		cs = 1; rw = 0; sclk = 1'bx; #5
		cs = 0; #5
		repeat (8) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(addr_we != 1) $display("Not in got state, address latch not enabled!");
		repeat (9) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(dm_we != 1) $display("Not in write2 state, datamem is not enabled!");
		repeat (2) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(sr_we != 0 || miso_bufe !=0 || dm_we != 0 || addr_we != 0 ) $display("Not in get state!");

	$display("Read Cycle tests");
		cs = 1; rw = 1; sclk = 1'bx; #5
		cs = 0; #5
		repeat (8) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(addr_we != 1) $display("Not in got state, address latch not enabled!");
		repeat (2) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(sr_we != 1) $display("Not in read2 state, shiftregister write enable is not enabled!");
		repeat (1) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(miso_bufe != 1) $display("not in read3 state, miso_bufe is not enabled!");
		repeat (9) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		if(sr_we != 0 || miso_bufe !=0 || dm_we != 0 || addr_we != 0 ) $display("Not in get state!");

	$display("Chip Select test");
		cs = 1; rw = 1; sclk = 1'bx; #5
		cs = 0; #5
		repeat (8) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		repeat (2) begin
			sclk = 0; #5 sclk = 1; #5;
		end
		repeat (1) begin
			sclk = 0; #5 sclk = 1; #5;
		end //Currently in read3 state
		cs = 1; 
		sclk = 0; #5 sclk = 1; #5;
		if(sr_we != 0 || miso_bufe !=0 || dm_we != 0 || addr_we != 0 ) $display("Not in get state!");

	end
endmodule