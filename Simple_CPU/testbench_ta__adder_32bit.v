module testbench_ta__adder_32bit();
	reg [31:0]in1, in2;
	wire [31:0]sum;
	
	adder_32bit A32(in1, in2, sum);
	
	initial begin
		//---------- test1 ----------
		   in1=32'hAAAA_AAAA; in2=32'h5555_5555;
		#5 if(sum==32'hFFFF_FFFF)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!!");
			end
		//---------- test2 ----------
		#5 in1=32'hAAAA_AAAA; in2=32'h5555_5556;
		#5 if(sum==0)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!!");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
