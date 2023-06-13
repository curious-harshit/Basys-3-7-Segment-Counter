`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2023 14:25:58
// Design Name: 
// Module Name: slow_clock_4Mhz
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

module slow_clock_4Mhz(sclk,clk);
input clk;
output reg sclk=0;
reg [23:0] count=0;
always@(posedge clk) begin
count<=count+1;
if(count==12500000)
begin
count<=0;
sclk=!sclk;
end
end
endmodule