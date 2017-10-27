module system(clk,rst,out_7seg);
   input clk,rst;
	output [6:0]out_7seg;
	
	wire divided_clk;
	wire [3:0]out;
	
	frequency_divider FD(clk,rst,divided_clk);
	counter_4bit C(divided_clk,rst,out);
   bin_to_7seg BT7(out,out_7seg);

endmodule

-------------------------------------------------
module frequency_divider(clk,rst,divided_clk);
  input  clk,rst;
  output divided_clk;
  
  reg divided_clk;
  reg [24:0]count;
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
	    divided_clk<=1'b0;
       count<=25'b0;
   end
	else if(count==25'd24000000)begin
	    divided_clk<=~divided_clk;
       count<=25'b0;
	end
	else begin
	     count<=count+25'b1;
   end
	end
endmodule

--------------------------------------------------
module counter_4bit(clk,rst,out);
   input  clk,rst;
	output [3:0]out;
	
	reg [3:0]out;
	
	
	always@(posedge clk or posedge rst)begin
      if(rst)out<=4'b0;
		else out<=out+4'b1;
	end
	


endmodule
-----------------------------------------------------
module bin_to_7seg(out, out_7seg);
   input [3:0]out;
	output [6:0]out_7seg;
	
	reg [6:0]out_7seg;
	
	always@(*)begin
	   case(out)
		   4'b0000: out_7seg=7'b0111111;
			4'b0001: out_7seg=7'b0000110;
			4'b0010: out_7seg=7'b1011011;
			4'b0011: out_7seg=7'b1001111;
			4'b0100: out_7seg=7'b1100110;
			4'b0101: out_7seg=7'b1101101;
			4'b0110: out_7seg=7'b1111101;
			4'b0111: out_7seg=7'b0000111;
			4'b1000: out_7seg=7'b1111111;
			4'b1001: out_7seg=7'b1101111;
			4'b1010: out_7seg=7'b1110111;
			4'b1011: out_7seg=7'b1111100;
			4'b1100: out_7seg=7'b0111001;
			4'b1101: out_7seg=7'b1011110;
			4'b1110: out_7seg=7'b1111001;
			4'b1111: out_7seg=7'b1110001;
			default: out_7seg=7'b0000000;
      endcase
   end		

endmodule

-----------------------------------------------------------
module system_testbench;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [6:0] out_7seg;

	// Instantiate the Unit Under Test (UUT)
	system uut (
		.clk(clk), 
		.rst(rst), 
		.out_7seg(out_7seg)
	);
	
	
	always #2 clk=~clk;

	initial begin
		// Initialize Inputs
		rst=1'd0;
		clk = 1'b0;
		#2 rst=1'd1;
		#2 rst=1'd0;

       

		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		// Add stimulus here

	end
      
endmodule