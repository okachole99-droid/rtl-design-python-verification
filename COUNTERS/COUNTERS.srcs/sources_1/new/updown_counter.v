`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2025 22:45:04
// Design Name: 
// Module Name: updown_counter
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


module updown_counter(
  input clk,rst,up_down,
  output reg [3:0] count
    );
 always @(posedge clk or negedge rst)
  begin
   if(rst)
   count = 4'b0000;
   else
    if(up_down)
    if ( count == 4'b1111)
    count = 4'b0000;
    else
    count = count + 1;
    else
    if (count == 4'b0000)
    count = 4'b1111;
    else
    count = count - 1; 
   end 
endmodule
