`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 16:09:42
// Design Name: 
// Module Name: sipo
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

module sipo #(
    parameter WIDTH = 4
)(
    input  wire                 clk,
    input  wire                 rst_n,        
    input  wire                 shift_en,     
    input  wire                 load_en,      
    input  wire [WIDTH-1:0]     load_data,    
    input  wire                 serial_in,    
    output reg  [WIDTH-1:0]     parallel_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        parallel_out <= 0;
   
    else if (load_en)
        parallel_out <= load_data;
        
    else if (shift_en)
        parallel_out <= {parallel_out[WIDTH-2:0], serial_in};
        
end

endmodule