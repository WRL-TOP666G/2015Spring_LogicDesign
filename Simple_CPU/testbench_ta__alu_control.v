module testbench_ta__alu_control();
	reg [1:0]alu_op;
	reg [5:0]funct;
	wire [3:0]alu_operation;
	
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
	
	alu_control AC(alu_op, funct, alu_operation);
	
	initial begin
		//---------- test 1 ----------
		   alu_op=0; funct=0;
		#5 if(alu_operation==`ADD)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!! (alu_op=0)");
			end
		//---------- test 2 ----------
		#5 alu_op=1; funct=0;
		#5 if(alu_operation==`SUB)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!! (alu_op=1)");
			end
		//---------- test 3 ----------
		#5 alu_op=2; funct=`R_ADD;
		#5 if(alu_operation==`ADD)begin
				$display("> test3 pass!!");
			end
			else begin
				$display("> test3 fail!! (alu_op=2, funct=ADD)");
			end
		//---------- test 4 ----------
		#5 alu_op=2; funct=`R_SUB;
		#5 if(alu_operation==`SUB)begin
				$display("> test4 pass!!");
			end
			else begin
				$display("> test4 fail!! (alu_op=2, funct=SUB)");
			end
		//---------- test 5 ----------
		#5 alu_op=2; funct=`R_AND;
		#5 if(alu_operation==`AND)begin
				$display("> test5 pass!!");
			end
			else begin
				$display("> test5 fail!! (alu_op=2, funct=AND)");
			end
		//---------- test 6 ----------
		#5 alu_op=2; funct=`R_OR;
		#5 if(alu_operation==`OR)begin
				$display("> test6 pass!!");
			end
			else begin
				$display("> test6 fail!! (alu_op=2, funct=OR)");
			end
		//---------- test 7 ----------
		#5 alu_op=2; funct=`R_SLT;
		#5 if(alu_operation==`SLT)begin
				$display("> test7 pass!!");
			end
			else begin
				$display("> test7 fail!! (alu_op=2, funct=SLT)");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
