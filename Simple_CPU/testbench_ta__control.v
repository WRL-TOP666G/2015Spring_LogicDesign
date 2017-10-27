module testbench_ta__control();
	reg [5:0]op;
	wire reg_dst, reg_write, 
		  alu_src, 
		  mem_to_reg, mem_read, mem_write, 
		  branch, jump;
	wire [1:0]alu_op;
	
	`define R_TYPE 6'd0
	`define I_BEQ  6'd4
	`define I_LW   6'd35
	`define I_SW   6'd43
	`define J_J    6'd2
	
	control C(op, 
				 reg_dst, reg_write, 
				 alu_src, alu_op, 
				 mem_to_reg, mem_read, mem_write, 
				 branch, jump
				 );
	initial begin
		//---------- test 1 ----------
		   op=`R_TYPE;
		#5 if(reg_dst==1 && reg_write==1 && alu_src==0 && alu_op==2 && 
				mem_to_reg==0 && mem_read==0 && mem_write==0 && 
				branch==0 && jump==0)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!! (op=R_TYPE)");
			end
		//---------- test 2 ----------
		#5 op=`I_BEQ;
		#5 if(reg_dst==0 && reg_write==0 && alu_src==0 && alu_op==1 && 
				mem_to_reg==0 && mem_read==0 && mem_write==0 && 
				branch==1 && jump==0)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!! (op=I_BEQ)");
			end
		//---------- test 3 ----------
		#5 op=`I_LW;
		#5 if(reg_dst==0 && reg_write==1 && alu_src==1 && alu_op==0 && 
				mem_to_reg==1 && mem_read==1 && mem_write==0 && 
				branch==0 && jump==0)begin
				$display("> test3 pass!!");
			end
			else begin
				$display("> test3 fail!! (op=I_LW)");
			end
		//---------- test 4 ----------
		#5 op=`I_SW;
		#5 if(reg_dst==0 && reg_write==0 && alu_src==1 && alu_op==0 && 
				mem_to_reg==0 && mem_read==0 && mem_write==1 && 
				branch==0 && jump==0)begin
				$display("> test4 pass!!");
			end
			else begin
				$display("> test4 fail!! (op=I_SW)");
			end
		//---------- test 5 ----------
		#5 op=`J_J;
		#5 if(reg_dst==0 && reg_write==0 && alu_src==0 && alu_op==0 && 
				mem_to_reg==0 && mem_read==0 && mem_write==0 && 
				branch==0 && jump==1)begin
				$display("> test5 pass!!");
			end
			else begin
				$display("> test5 fail!! (op=J_J)");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
