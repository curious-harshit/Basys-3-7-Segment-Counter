`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2023 12:56:34
// Design Name: 
// Module Name: range_up_counter
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


module bcd_counter_4_digit(bcdcount,sclk);
input sclk;
output reg [15:0]bcdcount=0;
always@(posedge sclk) begin
if(bcdcount[3:0]==9)begin
bcdcount[3:0]=0;
if(bcdcount[7:4]==9)begin
bcdcount[7:4]=0;
if(bcdcount[11:8]==9)begin
bcdcount[11:8]=0;
if(bcdcount[15:12]==9)
bcdcount[15:12]=0;
else
bcdcount[15:12]=bcdcount[15:12]+1;
end
else
bcdcount[11:8]=bcdcount[11:8]+1;
end
else
bcdcount[7:4]=bcdcount[7:4]+1;
end
else
bcdcount[3:0]=bcdcount[3:0]+1;
end
endmodule
