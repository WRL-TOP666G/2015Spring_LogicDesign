module testbench_ta__alu_32bit();
	reg [31:0]in1, in2;
	reg [3:0]alu_operation;
	wire [31:0]alu_result;
	wire zero;
	
	`define AND 4'd0
	`define OR  4'd1
	`define ADD 4'd2
	`define SUB 4'd6
	`define SLT 4'd7
	`define NOR 4'd12
	
	alu_32bit ALU32(in1, in2, alu_operation, alu_result, zero);
	
	initial begin
		//---------- test1 ----------
		   in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`AND;
		#5 if(alu_result==0 && zero==1)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!! (alu_operation AND fail)");
			end
		//---------- test2 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`OR;
		#5 if(alu_result==32'hFFFF_FFFF && zero==0)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!! (alu_operation OR fail)");
			end
		//---------- test3 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`ADD;
		#5 if(alu_result==32'hFFFF_FFFF && zero==0)begin
				$display("> test3 pass!!");
			end
			else begin
				$display("> test3 fail!! (alu_operation ADD fail)");
			end
		//---------- test4 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`SUB;
		#5 if(alu_result==32'h5555_5555 && zero==0)begin
				$display("> test4 pass!!");
			end
			else begin
				$display("> test4 fail!! (alu_operation SUB fail)");
			end
		//---------- test5 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`SLT;
		#5 if(alu_result==0 && zero==1)begin
				$display("> test5 pass!!");
			end
			else begin
				$display("> test5 fail!! (alu_operation SLT fail)");
			end
		//---------- test6 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5555; alu_operation=`NOR;
		#5 if(alu_result==0 && zero==1)begin
				$display("> test6 pass!!");
			end
			else begin
				$display("> test6 fail!! (alu_operation NOR fail)");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
