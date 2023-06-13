`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2023 11:59:42
// Design Name: 
// Module Name: counter_7_segment
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_7_segment(seg,an,clk);
input clk;
output reg [0:6] seg;
output reg [3:0] an;
wire [1:0] ledcount;
reg [19:0] tclk=0;
wire sclk;
wire [15:0]bcdcount;
reg [3:0]lednumber;
slow_clock_4Mhz S1(sclk,clk);
bcd_counter_4_digit C1(bcdcount,sclk);

always@(posedge clk)
tclk=tclk+1;
assign ledcount=tclk[19:18];// ~ 2.6ms for each 7 segment display
always@(*)//~10.5ms refresh rate
case(ledcount)
2'b00:begin
an=4'b1110;
lednumber=bcdcount[3:0];
end
2'b01:begin
an=4'b1101; 
lednumber=bcdcount[7:4];
end
2'b10:begin 
an=4'b1011; 
lednumber=bcdcount[11:8];
end
2'b11:begin 
an=4'b0111; 
lednumber=bcdcount[15:12];
end
default:begin
an=4'b1111;
lednumber=0;
end
endcase
always@(lednumber)
case(lednumber)
0:seg=7'b0000001;
1:seg=7'b1001111;
2:seg=7'b0010010;
3:seg=7'b0000110;
4:seg=7'b1001100;
5:seg=7'b0100100;
6:seg=7'b0100000;
7:seg=7'b0001111;
8:seg=7'b0000000;
9:seg=7'b0000100;
default:seg=7'b0000001;
endcase
endmodule
