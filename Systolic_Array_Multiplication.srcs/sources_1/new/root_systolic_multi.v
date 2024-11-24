`timescale 1ns / 1ps
module PE( /// Operates on the 16 bit data
input [15:0] a, b,
input clk, rst, // Asynchronous Reset
output reg [15:0] ap, bp,
output reg [31:0] res
);

wire [31:0] multi_result;
assign multi_result = a * b; // Combinational Block
always @(posedge clk or posedge rst) begin // Sequential Block
if(rst) begin
ap <= 0;
bp <= 0;
res <= 0;
end

else begin
res <= res + multi_result;
ap <= a;
bp <= b;
end
end
endmodule
	
module root_systolic_multi(	      
input [15:0] inp_right0, inp_right4, inp_right8, inp_right12,
		      inp_down0, inp_down1, inp_down2, inp_down3,
	output reg done,
	input clk, rst
    );
    
    reg [3:0] count;  
        wire [31:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;

        wire [15:0] inp_down0, inp_down1, inp_down2, inp_down3;
        wire [15:0] inp_right0, inp_right4, inp_right8, inp_right12;
        wire [15:0] outp_down0, outp_down1, outp_down2, outp_down3, outp_down4, outp_down5, outp_down6, outp_down7, outp_down8, outp_down9, outp_down10, outp_down11, outp_down12, outp_down13, outp_down14, outp_down15;
        wire [15:0] outp_right0, outp_right1, outp_right2, outp_right3, outp_right4, outp_right5, outp_right6, outp_right7, outp_right8, outp_right9, outp_right10, outp_right11, outp_right12, outp_right13, outp_right14, outp_right15;
        //      |    |      |     |
        //      v    v      v     v
        // --> P0 ->  P1  ->  P2 ->  P3
        // --> P4 ->  P5  ->  P6 ->  P7
        // --> P8 - > P9  ->  P10 -> P11
        // --> P12 -> P13 ->  P14 -> P15
        
        PE P0 (inp_down0, inp_right0, clk, rst, outp_down0, outp_right0, result0);
        PE P1 (inp_down1, outp_right0, clk, rst, outp_down1, outp_right1, result1);
        PE P2 (inp_down2, outp_right1, clk, rst, outp_down2, outp_right2, result2);
        PE P3 (inp_down3, outp_right2, clk, rst, outp_down3, outp_right3, result3);
        PE P4 (outp_down0, inp_right4, clk, rst, outp_down4, outp_right4, result4);
        PE P5 (outp_down1, outp_right4, clk, rst, outp_down5, outp_right5, result5);
        PE P6 (outp_down2, outp_right5, clk, rst, outp_down6, outp_right6, result6);
        PE P7 (outp_down3, outp_right6, clk, rst, outp_down7, outp_right7, result7);
        PE P8 (outp_down4, inp_right8, clk, rst, outp_down8, outp_right8, result8);
        PE P9 (outp_down5, outp_right8, clk, rst, outp_down9, outp_right9, result9);
        PE P10 (outp_down6, outp_right9, clk, rst, outp_down10, outp_right10, result10);
        PE P11 (outp_down7, outp_right10, clk, rst, outp_down11, outp_right11, result11);
        PE P12 (outp_down8, inp_right12, clk, rst, outp_down12, outp_right12, result12);
        PE P13 (outp_down9, outp_right12, clk, rst, outp_down13, outp_right13, result13);
        PE P14 (outp_down10, outp_right13, clk, rst, outp_down14, outp_right14, result14);
        PE P15 (outp_down11, outp_right14, clk, rst, outp_down15, outp_right15, result15);
        
        always @(posedge clk or posedge rst) begin
            if(rst) begin
                done <= 0;
                count <= 0;
            end
            else begin
                if(count == 'd9) begin
                    done <= 1;
                    count <= 0;
                end
                else begin
                    done <= 0;
                    count <= count + 1;
                end
            end    
        end 
endmodule
