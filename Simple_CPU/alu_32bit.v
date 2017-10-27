module alu_32bit(in1, in2, alu_operation, alu_result, zero);
	input [31:0]in1, in2;
	input [3:0]alu_operation;
	output [31:0]alu_result;
	output zero;
	
	`define AND 4'd0
	`define OR  4'd1
	`define ADD 4'd2
	`define SUB 4'd6
	`define SLT 4'd7
	`define NOR 4'd12
	
	/* design here */
	
endmodule
