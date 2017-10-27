module system(clk, rst, 
				  instruction, data_mem_out, 
				  mem_read, mem_write, 
				  alu_out, reg_file_out_2, pc
				  );
	input clk, rst;
	input [31:0]instruction, data_mem_out;
	output mem_read, mem_write;
	output [31:0]alu_out, reg_file_out_2, pc;
	//design

	
	wire [5:0]op         = instruction[31:26];
	wire [4:0]rs         = instruction[25:21];
	wire [4:0]rt         = instruction[20:16];
	wire [4:0]rd         = instruction[15:11];
	wire [4:0]shamt      = instruction[10:6];
	wire [5:0]funct      = instruction[5:0];
	wire [15:0]immediate = instruction[15:0];
	wire [25:0]address   = instruction[25:0];
	
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
		//new design
	wire jump_addr;
	//---------- control ----------
	control C(.op(op), 
				    .reg_dst(reg_dst), 
				    .reg_write(reg_write), 
				    .alu_src(alu_src), 
				    .alu_op(alu_op), 
				    .mem_to_reg(mem_to_reg), 
				    .mem_read(mem_read), 
				    .mem_write(mem_write), 
			    	 .branch(branch), 
				    .jump(jump)
				 );
	alu_control ALU_C(.alu_op(alu_op), 
							      .funct(funct), 
							      .alu_operation(alu_operation)
							      );
	//---------- datapath ----------
	program_counter PC(.clk(clk), 
							       .rst(rst), 
							       .next_pc(next_pc), 
							       .pc(pc)
							       );
	reg_file RF(.clk(clk), 
					    .rst(rst), 
					    .reg_write(reg_write), 
					    .read_addr_1(rs), 
					    .read_addr_2(rt), 
					    .write_addr(mux1_out), 
					    .write_data(mux2_out), 
					    .read_data_1(reg_file_out_1), 
					    .read_data_2(reg_file_out_2)
					    );
	alu_32bit ALU(.in1(reg_file_out_1), 
					      .in2(mux3_out), 
					      .alu_operation(alu_operation), 
					      .alu_result(alu_out), 
					      .zero(zero)
					     );
	adder_32bit ADD1(.in1(4), 
						  .in2(pc), 
						  .sum(pc_add_4)
						  );
	adder_32bit ADD2(.in1(pc_add_4), 
						       .in2({sign_extend_out[29:0],2'b00}), 
						       .sum(adder2_out)
						  );
	sign_extend SE(.in(immediate), 
						     .out(sign_extend_out)
						     );
	assign next_pc = jump ? jump_addr :
						  pc_src ? adder2_out :
						  pc_add_4;
	assign mux1_out = reg_dst ? rd : rt;
	assign mux2_out = mem_to_reg ? data_mem_out : alu_out;
	assign mux3_out = alu_src ? sign_extend_out : reg_file_out_2;
	assign pc_src = branch & zero;
	//new design
	assign jump_addr={pc_add_4[31:28],address,2'b00};
	//assign in1=32'd4;
	//assign sign_extend_out={sign_extend_out[29:0],2'b00};
	
endmodule
