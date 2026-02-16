`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 10:20:55
// Design Name: 
// Module Name: ALU
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


module ALU(
input [3:0] A,B,
input [2:0] opcode,
input oprand_sel,
output reg [3:0] ALU_out,
output reg carry 
    );
always@(*)begin
carry = 0;
ALU_out = 0;
 case (opcode)
 3'b000 : {carry,ALU_out} = A + B;
 3'b001 : {carry,ALU_out} = A - B;
 3'b010 : ALU_out = A & B;
 3'b011 : ALU_out = A | B;
 3'b100 : ALU_out = A ^ B;
 3'b101 : ALU_out = ~(A ^ B);
 3'b110 : begin 
          if (oprand_sel == 1'b0)
           ALU_out = A<<1;
          else 
           ALU_out = B<<1;
          end
 3'b111 : begin 
          if (oprand_sel == 1'b0)
           ALU_out = A>>1;
          else 
           ALU_out = B>>1;
          end
 default: ALU_out = 4'b000;
 
 endcase   
 end
endmodule