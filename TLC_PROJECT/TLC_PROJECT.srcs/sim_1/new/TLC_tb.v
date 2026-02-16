`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2025 20:12:55
// Design Name: 
// Module Name: TLC_tb
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

`timescale 1ns/1ps

module TLC_tb( );

    reg clock;
    reg clear;
    reg X;
    wire [1:0] hwy;
    wire [1:0] cntry;

    // instantiate DUT
TLC DUT(
        .hwy(hwy),
        .cntry(cntry),
        .X(X),
        .clock(clock),
        .clear(clear)
    );

    // clock generation  (10ns period)
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
       

        // start
        clear = 1; X = 0;
        #20;
        clear = 0;

        // no car on country → highway remain green
        #100;

        // car detected on country
        X = 1;
        #200;

        // car gone
        X = 0;
        #200;

        // again no car
        #200;

        $finish;
    end

endmodule
