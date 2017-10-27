module testbench_ta__data_mem();
	reg clk, rst, mem_read, mem_write;
	reg [31:0]addr, write_data;
	wire [31:0]read_data;
	
	`define DMEM_SIZE 64//real size=2<<(32-2), but it's too large to implement.
	
	integer i, file;
	
	data_mem DMEM(clk, rst, mem_read, mem_write, 
					  addr, write_data, 
					  read_data);
	
	initial clk=1'b1;
	always #5 clk=~clk;
	
	initial begin
			rst=1;
		#5 rst=0;
			$readmemh("data_1.txt", DMEM.mem);
		//---------- test1 ----------
		#5 file = $fopen("report.txt");
			for(i=0;i<`DMEM_SIZE;i=i+1)begin
				$fdisplay(file, "%h_%h", DMEM.mem[i][31:16], DMEM.mem[i][15:0]);
			end
		//---------- test end ----------
		#5	$fclose(file);
			$finish;
	end
	
endmodule
