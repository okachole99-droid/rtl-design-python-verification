`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 16:12:10
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb();
parameter WIDTH = 4;
reg clk;
reg rst_n;
reg shift_en;   
reg load_en;     
reg [WIDTH-1:0] load_data;    
reg  serial_in;    
wire [WIDTH-1:0] parallel_out;

sipo #(
       .WIDTH(WIDTH)
       )
    dut (
         clk , rst_n,shift_en,load_en,load_data,serial_in,parallel_out
    ); 
initial clk = 0;
always #5 clk = ~clk;

initial begin
    rst_n     = 0;
    shift_en  = 0;
    load_en   = 0;
    load_data = 0;
    serial_in = 0;
    
    #12;
    rst_n = 1;
    
    shift_en = 1;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;
    shift_en = 0;
    
    #20;
    load_en   = 1;
    load_data = 4'b1100;
    #10;
    load_en   = 0;
    
    shift_en = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    shift_en = 0;

    #50;
    $finish;
end
initial begin
    $monitor("Time=%0t rst=%b shift=%b load=%b serial_in=%b parallel_out=%b",
              $time, rst_n, shift_en, load_en, serial_in, parallel_out);
end

endmodule
