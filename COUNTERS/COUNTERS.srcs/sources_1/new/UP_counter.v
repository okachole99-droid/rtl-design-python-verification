`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2025 14:38:33
// Design Name: 
// Module Name: UP_counter
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


module UP_counter(
    input clk,
    input reset,
    output reg [3:0] counter
    );
   // assign counter = count_up;
always @(posedge clk or posedge reset)
 begin
    if (reset)
        counter <= 0;
    else
       counter <= counter + 1;
end
endmodule
