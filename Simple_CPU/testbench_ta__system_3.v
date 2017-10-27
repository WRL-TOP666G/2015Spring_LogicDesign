module testbench_ta__system_3();
	reg clk, rst;
	wire [31:0]instruction, data_mem_out;
	wire mem_read, mem_write;
	wire [31:0]alu_out, reg_file_out_2, pc;
	
	//---------- memory ----------
	instruction_mem IMEM(.clk(clk), 
								.rst(rst), 
								.addr(pc), 
								.instruction(instruction)
								);
	data_mem DMEM(.clk(clk), 
					  .rst(rst), 
					  .mem_read(mem_read), 
					  .mem_write(mem_write), 
					  .addr(alu_out),
					  .write_data(reg_file_out_2), 
					  .read_data(data_mem_out)
					  );
	//---------- CPU ----------
	system CPU(.clk(clk), 
				  .rst(rst), 
				  .instruction(instruction), 
				  .data_mem_out(data_mem_out), 
				  .mem_read(mem_read), 
				  .mem_write(mem_write), 
				  .alu_out(alu_out), 
				  .reg_file_out_2(reg_file_out_2), 
				  .pc(pc)
				  );
	
	initial clk=1'b1;
	always #5 clk=~clk;
	
	initial begin
			rst=1;
		#5 rst=0;
			$readmemb("program_3.txt", IMEM.mem);
			$readmemh("data_1.txt", DMEM.mem);
		//---------- test1 ----------
		#100 
			$display("> data 0 : %h_%h", DMEM.mem[0][31:16], DMEM.mem[0][15:0]);
			$display("> data 1 : %h_%h", DMEM.mem[1][31:16], DMEM.mem[1][15:0]);
			$display("> data 2 : %h_%h", DMEM.mem[2][31:16], DMEM.mem[2][15:0]);
			$display("> data 3 : %h_%h", DMEM.mem[3][31:16], DMEM.mem[3][15:0]);
			$display("> data 4 : %h_%h", DMEM.mem[4][31:16], DMEM.mem[4][15:0]);
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
