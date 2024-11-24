`timescale 1ns / 1ps
module root_systolic_array_tb();

reg [15:0] inp_right0, inp_right4, inp_right8, inp_right12;
reg [15:0] inp_down0, inp_down1, inp_down2, inp_down3;
wire done;

reg clk, rst;

root_systolic_multi uut (inp_right0, inp_right4, inp_right8, inp_right12, inp_down0, inp_down2, inp_down3, inp_down4 ,done, clk, rst);

initial begin
	#3  inp_right0 <= 16'd3;
	    inp_down0 <= 16'd12;
	#10 inp_right0 <= 16'd2;
	    inp_down0 <= 16'd8;
	#10 inp_right0 <= 16'd1;
	    inp_down0 <= 16'd4;
	#10 inp_right0 <= 16'd0;
	    inp_down0 <= 16'd0;
	#10 inp_right0 <= 16'd0;
	    inp_down0 <= 16'd0;
	#10 inp_right0 <= 16'd0;
	    inp_down0 <= 16'd0;
	#10 inp_right0 <= 16'd0;	
	    inp_down0 <= 16'd0;
end

initial begin
	#3  inp_right4 <= 16'd0;
	    inp_down1 <= 16'd0;
	#10 inp_right4 <= 16'd7;
	    inp_down1 <= 16'd13;
	#10 inp_right4 <= 16'd6;
	    inp_down1 <= 16'd9;
	#10 inp_right4 <= 16'd5;
	    inp_down1 <= 16'd5;
	#10 inp_right4 <= 16'd4;
	    inp_down1 <= 16'd1;
	#10 inp_right4 <= 16'd0;
	    inp_down1 <= 16'd0;
	#10 inp_right4 <= 16'd0;	
	    inp_down1 <= 16'd0;
end

initial begin
	#3  inp_right8 <= 16'd0;
	    inp_down2 <= 16'd0;
	#10 inp_right8 <= 16'd0;
	    inp_down2 <= 16'd0;
	#10 inp_right8 <= 16'd11;
	    inp_down2 <= 16'd14;
	#10 inp_right8 <= 16'd10;
	    inp_down2 <= 16'd10;
	#10 inp_right8 <= 16'd9;
	    inp_down2 <= 16'd6;
	#10 inp_right8 <= 16'd8;
	    inp_down2 <= 16'd2;
	#10 inp_right8 <= 16'd0;	
	    inp_down2 <= 16'd0;
end

initial begin
	#3  inp_right12 <= 16'd0;
	    inp_down3 <= 16'd0;
	#10 inp_right12 <= 16'd0;
	    inp_down3 <= 16'd0;
	#10 inp_right12 <= 16'd0;
	    inp_down3 <= 16'd0;
	#10 inp_right12 <= 16'd15;
	    inp_down3 <= 16'd15;
	#10 inp_right12 <= 16'd14;
	    inp_down3 <= 16'd11;
	#10 inp_right12 <= 16'd13;
	    inp_down3 <= 16'd7;
	#10 inp_right12 <= 16'd12;	
	    inp_down3 <= 16'd3;
end

initial begin
rst <= 1;
clk <= 0;
#3
rst <= 0;
end

initial begin
	repeat(21)
		#5 clk <= ~clk;
end

endmodule
