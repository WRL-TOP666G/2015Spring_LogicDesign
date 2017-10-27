module testbench_ta__instruction_mem();
	reg clk, rst;
	reg [31:0]addr;
	wire [31:0]instruction;
	
	`define IMEM_SIZE 64//real size=2<<(32-2), but it's too large to implement.
	
	integer i, file;
	
	instruction_mem IMEM(clk, rst, addr, instruction);
	
	initial clk=1'b1;
	always #5 clk=~clk;
	
	initial begin
			rst=1;
		#5 rst=0;
			$readmemb("program_1.txt", IMEM.mem);
		//---------- test1 ----------
		#5 file = $fopen("report.txt");
			for(i=0;i<`IMEM_SIZE;i=i+1)begin
				$fdisplay(file, "%h", IMEM.mem[i]);
			end
		//---------- test end ----------
		#5	$fclose(file);
			$finish;
	end
	
endmodule
