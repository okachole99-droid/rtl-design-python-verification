`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 14:07:34
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
reg [3:0] A,B;
reg [2:0] opcode;
reg oprand_sel;
wire [3:0] ALU_out;
wire carry;

 ALU dut (
 .A(A),
 .B(B),
 .opcode(opcode),
 .oprand_sel(oprand_sel),
 .ALU_out(ALU_out),
 .carry(carry)
 ); 
 reg [11:0] memo [0:99]; //4+4+3+1 = 12
 integer i;
 initial begin
    A = 0;
    B = 0;
    opcode = 0;
    oprand_sel = 0;
end
 initial begin
  $readmemb("ALU_input.mem",memo);
  for(i=0 ; i<100 ; i=i+1)begin 
    {A,B,opcode,oprand_sel} = memo[i];
    #5;
    $display("opcode=%b A=%b B=%b oprand_sel=%b | Out=%b Carry=%b",
                          opcode, A, B,oprand_sel, ALU_out, carry);
  end
  $finish;
 end   
endmodule
