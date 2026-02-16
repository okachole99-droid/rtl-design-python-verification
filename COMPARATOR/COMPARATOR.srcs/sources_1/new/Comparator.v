`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 23:26:11
// Design Name: 
// Module Name: Comparator
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


module Comparator(
input [3:0] A,B,
output gt,eq,lt
    );
    
 assign eq = &(A~^B);
 assign gt = (A[3] &~B[3])|(A[3]~^B[3]) & (A[2] &~B[2])|(A[3]~^B[3]) & (A[2]~^B[2]) & (A[1] &~B[1]) | (A[3]~^B[3]) & (A[2]~^B[2]) & (A[1] ~^ B[1]) & (A[0] &~B[0]);
 assign lt = ~(gt|eq);

endmodule
