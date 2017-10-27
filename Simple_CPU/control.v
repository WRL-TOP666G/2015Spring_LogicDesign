module control(op, 
					reg_dst, reg_write, 
					alu_src, alu_op, 
					mem_to_reg, mem_read, mem_write, 
					branch, jump
					);
	input [5:0]op;
	output reg_dst, reg_write, 
			 alu_src, 
			 mem_to_reg, mem_read, mem_write, 
			 branch, jump;
	output [1:0]alu_op;
	
	`define R_TYPE 6'd0
	`define I_BEQ  6'd4
	`define I_LW   6'd35
	`define I_SW   6'd43
	`define J_J    6'd2
	
	/* design here */
	
endmodule
