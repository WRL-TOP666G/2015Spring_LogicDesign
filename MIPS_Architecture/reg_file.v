`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:53 06/17/2015 
// Design Name: 
// Module Name:    reg_file 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reg_file(clk, rst, reg_write, 
					 read_addr_1, read_addr_2, write_addr, write_data, 
					 read_data_1, read_data_2
					 );
	input clk, rst, reg_write;
	input [4:0]read_addr_1, read_addr_2,write_addr;
	input [31:0]write_data;
	output [31:0]read_data_1, read_data_2;
	reg    [31:0]read_data_1, read_data_2;
	reg    [31:0]register[31:0];

  integer i;
  
	always@(posedge clk or posedge rst)begin
	  if(rst)
      for(i=0;i<32;i=i+1)
	       register[i] <= 32'd0; 
	  else if(reg_write)
		     register[write_addr]<=write_data; 
   end
	always@(*)begin
	     
	       
		 if(write_addr==0)begin
		   read_data_1=32'd0;
		   read_data_2=32'd0;
		   end
		 else begin 
		   read_data_1=register[read_addr_1];
		   read_data_2=register[read_addr_2];
		  end
   end
   
	
endmodule
