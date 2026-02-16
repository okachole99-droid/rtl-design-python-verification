`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2025 22:54:23
// Design Name: 
// Module Name: updown_tb
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


module updown_tb( );
reg clk;
reg rst;
reg up_down;
wire [3:0] count;

updown_counter dut (
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin
    rst = 1;
    up_down=1;  //up
    #10;           
    rst = 0;  
    up_down=0;   // down
    #250;          
    rst = 0; 
    up_down=1;    // up
    #300;
    rst = 1; 
    up_down=1;    
    #400;
    $stop;
end
endmodule

