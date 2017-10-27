module testbench_ta__sign_extend();
	reg [15:0]in;
	wire [31:0]out;
	
	sign_extend SE(in, out);
	
	initial begin
		//---------- test1 ----------
		   in=16'h1234;
		#5 if(out==32'h0000_1234)begin
				$display("> test1 pass!!");
			end
			else begin
				$display("> test1 fail!!");
			end
		//---------- test2 ----------
		#5 in=16'hABCD;
		#5 if(out==32'hFFFF_ABCD)begin
				$display("> test2 pass!!");
			end
			else begin
				$display("> test2 fail!!");
			end
		//---------- test end ----------
		#5 $finish;
	end
	
endmodule
