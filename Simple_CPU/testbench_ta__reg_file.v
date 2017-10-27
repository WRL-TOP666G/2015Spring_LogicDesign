module testbench_ta__reg_file();
	reg clk, rst, reg_write;
	reg [4:0]read_addr_1, read_addr_2, write_addr;
	reg [31:0]write_data;
	wire [31:0]read_data_1, read_data_2;
	
	reg_file RF(clk, rst, reg_write, 
					read_addr_1, read_addr_2, write_addr, write_data, 
					read_data_1, read_data_2
					);
	
	initial clk=1'b1;
	always #5 clk=~clk;
	
	initial begin
			rst=1;
		#5 rst=0;
		//---------- test1 ----------
		#5 reg_write=1'b1; read_addr_1=0; read_addr_2=0; write_addr=0; write_data=32'hFFFF_FFFF;
		#5	if(read_data_1==0 && read_data_2==0)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!! (register[0] should always be 0)");
			end
		//---------- test2 ----------
		#5	rst=0; reg_write=1'b1; read_addr_1=5'h1F; read_addr_2=5'h1E; write_addr=5'h1F; write_data=32'hFFFF_FFFF;
		#5	if(read_data_1==32'hFFFF_FFFF && read_data_2==0)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!! (write register[31] fail or read register[30] fail)");
			end
		//---------- test3 ----------
		#5	rst=0; reg_write=1'b0; read_addr_1=5'h10; read_addr_2=5'h0F; write_addr=5'h10; write_data=32'h8888_8888;
		#5	if(read_data_1==0 && read_data_2==32'h0)begin
				$display("> test3 pass!!");
			end
			else begin
				$display("> test3 fail!! (read register[16] fail or read register[15] fail)");
			end
		//---------- test4 ----------
		#5	rst=0; reg_write=1'b1; read_addr_1=5'h1F; read_addr_2=5'h1E; write_addr=5'h1E; write_data=32'h7777_7777;
		#5	if(read_data_1==32'hFFFF_FFFF && read_data_2==32'h7777_7777)begin
				$display("> test4 pass!!");
			end
			else begin
				$display("> test4 fail!! (write register[30] fail or read register[31] fail)");
			end
		//---------- test end ----------
		#5	$finish;
	end
	
endmodule
