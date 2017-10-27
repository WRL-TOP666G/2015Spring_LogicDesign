
module sign_extend(in, out);
	input [15:0]in;
	output [31:0]out;
	
	reg  [31:0]out;
	
	always@(in)
	 begin
	 if(in[15])begin
	    out[31:16]<=16'b1111111111111111;
		 out[15:0]<=in[15:0];
		 end
	else 
	   begin
	    out[31:16]<=16'b000000000000000;
		 out[15:0]<=in[15:0];
		 end
 end
	
endmodule
