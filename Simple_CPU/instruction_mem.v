module instruction_mem(clk, rst, addr, instruction);
	input clk, rst;
	input [31:0]addr;
	output [31:0]instruction;
	
	`define IMEM_SIZE 64//real size=2<<(32-2), but it's too large to implement.
	
	integer i;
	
	reg [31:0]mem[`IMEM_SIZE-1:0];
	
	assign instruction=mem[addr[31:2]];
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			for(i=0;i<`IMEM_SIZE;i=i+1)begin
				mem[i]<=32'b0;
			end
		end
	end
	
endmodule
