`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:45 05/20/2015
// Design Name:   system
// Module Name:   C:/logiclab/E24031035-5/lab9/sys_testbench.v
// Project Name:  lab9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sys_testbench;

	reg clk;
	reg rst;

	
	
	// Instantiate the Unit Under Test (UUT)
     system  u1 (clk,rst,row,column);

always #2 clk=~clk;

	initial begin
		// Initialize Inputs

		rst=1'b0;
		clk = 1'b1;
		#2 rst=1'b1;
		#2 rst=1'b0;


	end
      
endmodule

