module testbench_ta__program_counter();
	reg clk, rst;
	reg [31:0]next_pc;
	wire [31:0]pc;
	
	program_counter PC(clk, rst, next_pc, pc);
	
	initial clk=1'b1;
	always #5 clk=~clk;
	
	initial begin
		//---------- test1 ----------
			rst=1;
		#5 rst=0;
			if(pc==0)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!! (pc should be iniitialized as 0)");
			end
		//---------- test2 ----------
		#5 next_pc=32'hFFFF_FFFF;
		#5	if(pc==32'hFFFF_FFFF)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!! (write next_pc to pc fail)");
			end
		//---------- test3 ----------
		#5 next_pc=32'h7777_7777;
		#5	if(pc==32'h7777_7777)begin
				$display("> test3 pass!!");
			end
			else begin
				$display("> test3 fail!! (write next_pc to pc fail)");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
