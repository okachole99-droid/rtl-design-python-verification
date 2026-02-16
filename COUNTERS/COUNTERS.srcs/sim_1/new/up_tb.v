`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2025 14:44:58
// Design Name: 
// Module Name: up_tb
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


module up_tb();

reg clk;
reg reset;
wire [3:0] counter;

// Instantiate the Unit Under Test (UUT)
UP_counter uut (
    .clk(clk),
    .reset(reset),
    .counter(counter)
);

// Clock generator: toggles clk every 5 ns
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus: Reset and let counter run
initial begin
    reset = 1;
    #15;           // Hold reset for 15 ns
    reset = 0;     // Release reset, counter should start counting
    #100;          // Run simulation for additional 100 ns
    reset = 1;     // Apply reset to observe reset behavior
    #10;
    reset = 0;     // Let counter run again
    #40;
    $stop;
end
endmodule
