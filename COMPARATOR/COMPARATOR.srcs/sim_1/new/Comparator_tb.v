`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 23:27:04
// Design Name: 
// Module Name: Comparator_tb
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


module Comparator_tb();
reg [3:0] A ,B ;
wire eq,gt,lt;
 Comparator dut (
 .A(A),
 .B(B),
 .eq(eq),
 .gt(gt),
 .lt(lt)
 );
 reg [7:0] memo [0:99] ;
 integer i ;
 initial begin
 $readmemb("Input_AB.mem",memo);
 for(i=0;i<100;i=i+1)begin
    {A,B}= memo[i];
    #1;
    $display("A=%b|B=%b|eq=%b|gt=%b|lt=%b",A,B,eq,gt,lt);
 end
 end 
endmodule
