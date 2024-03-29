# MIPS (RISC) 32 bits Single Cycle Processor

## Introduction

Implementation of a 32-bit single-cycle microarchitecture MIPS (RISC) processor based on Harvard Architecture using **Verilog** HDL. The simulation was performed on **Xilinx-VIVADO** to run a program of **Fibonacci series** written with C language and compiled into machine code.

## Block Diagram

![MIPS](Documents/MIPS.png)
<center>Figure: Single Cycle Diagram (MIPS)</center>

## RTL

![RTL](Documents/RTL.png)
<center>Figure: RTL Diagram (MIPS)</center>

## ALU Control

![ALU_Control](Documents/ALU_Control.png)
<center>Figure: ALU Control Table</center>


## Control Unit

![Control_Unit](Documents/Control_Unit.png)
<center>Figure: Control Unit Table</center>

## Verilog Simulation

A set of instructions are used to test the single-cycle implementation.

## Testcase: 

## Nth Fibonacci Algorithm

![Fibonacci_Algorithm](Documents/Fibonacci_Function.png)
<center>Figure: Fibonacci Algorithm</center>


## Nth fibonacci number with store(SW) and load(LW) instructions

```assembly

001000_00000_01000_0000000000001011     // [0]    // addi $t0, $zero, 11 [[fib]]
000000_01000_00000_10000_00000_100000   // [1]    // add $s0, $t0, $0 [nth number]
001000_00000_01001_0000000000000001     // [2]    // addi $t1, $zero, 1
001000_00000_01010_1111111111111111     // [3]    // addi $t2, $zero, -1
000100_01000_00000_0000000000000110     // [4]    // beq $t0, $zero, end [[loop]]
000000_01001_01010_01001_00000_100000   // [5]    // add $t1, $t1, $t2
000000_01001_00000_00010_00000_100000   // [6]    // add $v0, $t1, $0 [result]
000000_01001_01010_01010_00000_100010   // [7]    // sub $t2, $t1, $t2
001000_01000_01000_1111111111111111     // [8]    // addi $t0, $t0, -1
000010_00000000000000000000000100       // [9]    // j loop
111111_00000000000000000000000000       // [10]   // nop [branch delay slot]
101011_00000_00010_0000000000001000     // [11]   // sw $v0, 8($zero) [[end]]
100011_00000_10001_0000000000001000     // [12]   // lw $s1, 8($zero)
111111_00000000000000000000000000       // [13]   // nop [load delay slot]

```

# Note: Add nop instruction after **Branch** and **Load** instructions for Branch Delay Slot and Load Delay Slot respectively.

## Simulation result:

![Fibonacci_Simulation](Documents/Fibonacci_Simulation.png)
<center>Figure: Fibonacci Simulation</center>

## Author 
- [@ntsdwkr](https://github.com/ntsdwkr) 

# Reference

Computer Organization and Design: the Hardware/Software Interface: Fifth Edition
Textbook by David A Patterson and John L. Hennessy
