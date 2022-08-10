`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Author: NITISH
// 
// Create Date: 08/08/2022 7:24:32 PM
// Design Name: 
// Module Name: fibonacci_tb
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


`define CYCLE_TIME 20

module top_tb;

  reg clk;
  integer i; // integer  counter;

  always #(`CYCLE_TIME / 2) clk = ~clk;

  top uut (.clk(clk));

  initial begin
    // Initialize data memory
    for (i = 0; i < 32; i = i + 1) begin
      uut.u_Data_memory.Dmem[i] = 32'b0;
    end

    // initialize Register File
    for (i = 0; i < 32; i = i + 1) begin
      uut.u_Register.RegData[i] = 32'b0;
    end
   // counter = 0;
    clk = 0;
  end
  
  initial begin 
    #300;  
    $monitor("Fibonacci = %0d", uut.u_Register.RegData[9]);
  end
  
  initial begin
    #1200 $finish;
  end


endmodule