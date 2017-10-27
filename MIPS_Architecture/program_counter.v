module program_counter(clk, rst, next_pc, pc);
	input clk, rst;
	input [31:0]next_pc;
	output [31:0]pc;
	
	reg    [31:0]pc;
	
	always@(posedge clk or posedge rst)
	 begin
	 if(rst)
	   pc<=32'b0;
	 else
	  pc<=next_pc;
	 
	 end
	
endmodule