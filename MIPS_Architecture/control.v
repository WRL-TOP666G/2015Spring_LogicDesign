module control(op, 
					reg_dst, reg_write, 
					alu_src, alu_op, 
					mem_to_reg, mem_read, mem_write, 
					branch, jump
					);
	input [5:0]op;
	output  alu_src,reg_dst, reg_write,   
			 mem_to_reg, mem_read, mem_write, 
			 branch, jump;
	output [1:0]alu_op;
	
	reg reg_dst, reg_write, 
			 alu_src, 
			 mem_to_reg, mem_read, mem_write, 
			 branch, jump;
	reg [1:0]alu_op;
	
	`define R_TYPE 6'd0
	`define I_BEQ  6'd4
	`define I_LW   6'd35
	`define I_SW   6'd43
	`define J_J    6'd2
	
	always@(*)begin
	  case(op)
	      6'd0: begin  reg_dst=1'b1;
			               reg_write=1'b1; 
			               alu_src=1'b0;
							       alu_op=2'd2;
			               mem_to_reg=1'b0; 
							       mem_read=1'b0; 
							       mem_write=1'b0; 
			               branch=1'b0; 
							       jump=1'b0;
 					    end 
			6'd4: begin  reg_dst=1'b0; 
			             reg_write=1'b0; 
			             alu_src=1'b0; 
							     alu_op=2'd1;
			             mem_to_reg=1'b0; 
							     mem_read=1'b0; 
							     mem_write=1'b0; 
			             branch=1'b1; 
							     jump=1'b0;
 					end
			6'd35: begin  reg_dst=1'b0; 
			              reg_write=1'b1; 
			              alu_src=1'b1; 
							      alu_op=2'd0;
			              mem_to_reg=1'b1; 
							      mem_read=1'b1;
							      mem_write=1'b0; 
			              branch=1'b0; 
							      jump=1'b0;
 					end
			6'd43: begin  reg_dst=1'b0; 
			              reg_write=1'b0; 
			              alu_src=1'b1; 
							      alu_op=2'd0;
			              mem_to_reg=1'b0; 
							      mem_read=1'b0; 
							      mem_write=1'b1; 
			              branch=1'b0; 
							      jump=1'b0;
 					end
			6'd2: begin  reg_dst=1'b0; 
			             reg_write=1'b0; 
			             alu_src=1'b0; 
							     alu_op=2'd0;
			             mem_to_reg=1'b0; 
							     mem_read=1'b0; 
							     mem_write=1'b0; 
			             branch=1'b0; 
							     jump=1'b1;
					
 					end
 			default:begin     
 			             reg_dst=1'b0; 
			             reg_write=1'b0; 
			             alu_src=1'b0; 
							     alu_op=2'd0;
			             mem_to_reg=1'b0; 
							     mem_read=1'b0; 
							     mem_write=1'b0; 
			             branch=1'b0; 
							     jump=1'b0;
							     end  
					endcase
					end
	endmodule		