`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: NITISH
// 
// Create Date: 07/23/2022 06:50:02 PM
// Design Name: 
// Module Name: Program_counter
// Project Name: MIPS
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


module Program_counter (
    input clk,
    input [31:0] next,  // the input address
    output reg [31:0] out  // the output address
);

  initial begin
    out = -4;  // NEVER REACHED ADDRESS
  end

  always @(posedge clk) begin
    out = next;
  end

endmodule

