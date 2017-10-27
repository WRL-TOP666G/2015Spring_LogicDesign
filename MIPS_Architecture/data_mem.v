module data_mem(clk, rst, mem_read, mem_write, 
					 addr, write_data, 
					 read_data);
	input clk, rst, mem_read, mem_write;
	input [31:0]addr, write_data;
	output [31:0]read_data;
	
	`define DMEM_SIZE 64//real size=2<<(32-2), but it's too large to implement.
	
	integer i;
	
	reg [31:0]mem[`DMEM_SIZE-1:0];
	
	assign read_data=mem[addr[31:2]];
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			for(i=0;i<`DMEM_SIZE;i=i+1)begin
				mem[i]<=32'b0;
			end
		end
		else if(mem_write)begin
			mem[addr[31:2]]<=write_data;
		end
	end
	
endmodule
