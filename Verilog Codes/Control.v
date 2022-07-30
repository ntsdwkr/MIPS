`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: NITISH
// 
// Create Date: 07/27/2022 1:24:12 AM
// Design Name: 
// Module Name: Control
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


module Control (
    input [31:0] instruction,
    output reg RegDst,
    output reg Jump,
    output reg Branch,
    output reg Bne,  // 1 indicates bne
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);

  // FIGURE 4.18 The setting of the control lines is completely determined 
  // by the opcode fields of the instruction

  initial begin
    RegDst = 0;
    Jump = 0;
    Branch = 0;
    MemRead = 0;
    MemtoReg = 0;
    ALUOp = 2'b00;
    MemWrite = 0;
    ALUSrc = 0;
    RegWrite = 0;
  end

  always @(instruction) begin
    case (instruction[31:26])
      6'b000000: begin  // ARITHMETIC
        RegDst = 1;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b10;
        Jump = 0;
      end
      6'b001000: begin  // addi
        RegDst = 0;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b001100: begin  // andi
        RegDst = 0;
        ALUSrc = 1;
        MemtoReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b11;
        Jump = 0;
      end
      6'b100011: begin  // lw
        RegDst = 0;
        ALUSrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b101011: begin  // sw
        RegDst = 0;  // X
        ALUSrc = 1;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
      6'b000100: begin  // beq
        RegDst = 0;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        Bne = 0;
        ALUOp = 2'b01;
        Jump = 0;
      end
      6'b000101: begin  // bne
        RegDst = 0;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        Bne = 1;
        ALUOp = 2'b01;
        Jump = 0;
      end
      6'b000010: begin  // j
        RegDst = 0;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b01;
        Jump = 1;
      end
      default: begin
        RegDst = 0;  // X
        ALUSrc = 0;
        MemtoReg = 0;  // X
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        Bne = 0;
        ALUOp = 2'b00;
        Jump = 0;
      end
    endcase
  end

endmodule
