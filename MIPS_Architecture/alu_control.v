module alu_control(alu_op, funct, alu_operation);
	input [1:0]alu_op;
	input [5:0]funct;
	output [3:0]alu_operation;
	
	reg  [3:0]alu_operation;
	
	
	`define AND 4'd0
	`define OR  4'd1
	`define ADD 4'd2
	`define SUB 4'd6
	`define SLT 4'd7
	`define NOR 4'd12
	
	`define R_ADD 6'd32
	`define R_SUB 6'd34
	`define R_AND 6'd36
	`define R_OR  6'd37
	`define R_SLT 6'd42
	
	always@(*)begin 
     case(alu_op)
	      2'd0 :  alu_operation=4'd2 ;
			  2'd1 :  alu_operation=4'd6 ;
	      2'd2 :  begin
			case(funct)
			   6'd32 : alu_operation=4'd2 ;
				 6'd34 : alu_operation=4'd6 ;
				 6'd36 : alu_operation=4'd0 ;
				 6'd37 : alu_operation=4'd1 ;
				 6'd42 : alu_operation=4'd7 ;
				 default alu_operation=4'd0 ;
				endcase
			end
			default alu_operation=4'd0 ;
	  
	  endcase
		
		end
		
	
endmodule
