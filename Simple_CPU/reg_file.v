module reg_file(clk, rst, reg_write, 
					 read_addr_1, read_addr_2, write_addr, write_data, 
					 read_data_1, read_data_2
					 );
	input clk, rst, reg_write;
	input [4:0]read_addr_1, read_addr_2, write_addr;
	input [31:0]write_data;
	output [31:0]read_data_1, read_data_2;
	
	/* design here */
	
endmodule
