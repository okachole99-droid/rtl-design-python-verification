`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 14:15:41
// Design Name: 
// Module Name: siso
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


module siso#(parameter WIDTH = 4)(
    input clk,rst,
    input serial_in,
    input op_sel,
    output reg serial_out
    );
reg [WIDTH-1:0] shift_reg;

always @(posedge clk or negedge rst)
    if(!rst)
    shift_reg<=4'b0;
    else begin 
    if(op_sel == 0)begin
   shift_reg<={shift_reg[WIDTH-2:0],serial_in};
   serial_out = shift_reg[WIDTH-1];
   end
    else begin
    shift_reg<={serial_in,shift_reg[WIDTH-1:1]};
    serial_out = shift_reg[0];
    end
    end

endmodule
