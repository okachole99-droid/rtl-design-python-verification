`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 14:28:46
// Design Name: 
// Module Name: siso_tb
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


module siso_tb();
parameter WIDTH = 4;
reg clk,rst;
reg op_sel;
reg serial_in;
wire serial_out;

      siso#(
            .WIDTH(WIDTH)
          )
          dut(
            .clk(clk),
            .rst(rst),
            .op_sel(op_sel),
            .serial_in(serial_in),
            .serial_out(serial_out)
          );

task apply_rst();
    begin
    rst=1'b0;
    #4;
    rst=1'b1;
    end
endtask
initial clk=0;
always #5 clk=~clk;

initial begin 
/*
apply_rst;
op_sel=1'b0;
serial_in = 1'b0; #10;
serial_in = 1'b1; #10;
serial_in = 1'b1; #10;
serial_in = 1'b0; #10;
$monitor("serial_in = %b serial_out=%b",serial_in,serial_out);
*/
apply_rst;
op_sel = 1'b1;
serial_in = 1'b0; #10;
serial_in = 1'b1; #10;
serial_in = 1'b1; #10;
serial_in = 1'b0; #10;
$monitor("serial_in = %b serial_out=%b",serial_in,serial_out);

end

endmodule
