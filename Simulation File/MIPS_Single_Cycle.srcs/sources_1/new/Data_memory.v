`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: NITISH
// 
// Create Date: 07/25/2022 12:26:12 AM
// Design Name: 
// Module Name: Data_memory
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


module Data_memory (
    input clk,
    input [31:0] addr,
    input [31:0] wData,
    input [31:0] ALUresult,
    input MemWrite,
    input MemRead,
    input MemtoReg,
    output reg [31:0] rData
);

  parameter SIZE_DM = 128;  // size of this memory, by default 128*32
  reg [31:0] Dmem[SIZE_DM-1:0];  // instruction memory

  // initially set default data to 0
  integer i;
  initial begin
    for (i = 0; i < SIZE_DM ; i = i + 1) begin
      Dmem[i] = 32'b0;
    end
  end

  always @(addr or MemRead or MemtoReg or ALUresult) begin
    if (MemRead == 1) begin
      if (MemtoReg == 1) begin
        rData = Dmem[addr];
      end else begin
        rData = ALUresult;  
      end
    end else begin
      rData = ALUresult;
    end
  end

  always @(posedge clk) begin  // MemWrite, wData, addr
    if (MemWrite == 1) begin
      Dmem[addr] = wData;
    end
  end

endmodule

