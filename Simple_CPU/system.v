module system(clk, rst, 
				  instruction, data_mem_out, 
				  mem_read, mem_write, 
				  alu_out, reg_file_out_2, pc
				  );
	input clk, rst;
	input [31:0]instruction, data_mem_out;
	output mem_read, mem_write;
	output [31:0]alu_out, reg_file_out_2, pc;
	
	wire [5:0]op         = instruction[/* design here */];
	wire [4:0]rs         = instruction[/* design here */];
	wire [4:0]rt         = instruction[/* design here */];
	wire [4:0]rd         = instruction[/* design here */];
	wire [4:0]shamt      = instruction[/* design here */];
	wire [5:0]funct      = instruction[/* design here */];
	wire [15:0]immediate = instruction[/* design here */];
	wire [25:0]address   = instruction[/* design here */];
	
	wire reg_dst;					//wires of control
	wire reg_write;
	wire alu_src;
	wire [1:0]alu_op;
	wire mem_to_reg;
	wire branch;
	wire jump;
	wire [3:0]alu_operation;	//wires of alu_control
	wire [31:0]next_pc;			//wires of program_counter
	wire [4:0]mux1_out;			//wires of reg_file
	wire [31:0]mux2_out;
	wire [31:0]reg_file_out_1;
	wire [31:0]reg_file_out_2;
	wire [31:0]mux3_out;			//wires of alu_32bit
	wire [31:0]alu_out;
	wire zero;
	wire [31:0]sign_extend_out;
	wire [31:0]pc_add_4;			//wires of adder2
	wire [31:0]adder2_out;
	wire pc_src;					//wires of other
	//---------- control ----------
	control C(.op(op), 
				 .reg_dst(/* design here */), 
				 .reg_write(/* design here */), 
				 .alu_src(/* design here */), 
				 .alu_op(/* design here */), 
				 .mem_to_reg(/* design here */), 
				 .mem_read(/* design here */), 
				 .mem_write(/* design here */), 
				 .branch(/* design here */), 
				 .jump(/* design here */)
				 );
	alu_control ALU_C(.alu_op(/* design here */), 
							.funct(/* design here */), 
							.alu_operation(/* design here */)
							);
	//---------- datapath ----------
	program_counter PC(.clk(clk), 
							 .rst(rst), 
							 .next_pc(/* design here */), 
							 .pc(/* design here */)
							 );
	reg_file RF(.clk(clk), 
					.rst(rst), 
					.reg_write(/* design here */), 
					.read_addr_1(/* design here */), 
					.read_addr_2(/* design here */), 
					.write_addr(/* design here */), 
					.write_data(/* design here */), 
					.read_data_1(/* design here */), 
					.read_data_2(/* design here */)
					);
	alu_32bit ALU(.in1(/* design here */), 
					  .in2(/* design here */), 
					  .alu_operation(/* design here */), 
					  .alu_result(/* design here */), 
					  .zero(/* design here */)
					  );
	adder_32bit ADD1(.in1(/* design here */), 
						  .in2(/* design here */), 
						  .sum(/* design here */)
						  );
	adder_32bit ADD2(.in1(/* design here */), 
						  .in2(/* design here */), 
						  .sum(/* design here */)
						  );
	sign_extend SE(.in(/* design here */), 
						.out(/* design here */)
						);
	assign next_pc = jump ? /* design here */ :
						  pc_src ? /* design here */ :
						  /* design here */;
	assign mux1_out = reg_dst ? /* design here */ : /* design here */;
	assign mux2_out = mem_to_reg ? /* design here */ : /* design here */;
	assign mux3_out = alu_src ? /* design here */ : /* design here */;
	assign pc_src = /* design here */ & /* design here */;
	
endmodule
