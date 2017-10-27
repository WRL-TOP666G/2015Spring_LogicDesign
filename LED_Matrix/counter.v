`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:58 05/20/2015 
// Design Name: 
// Module Name:    counter 
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
module counter(divided_clk,rst,sel);
   input divided_clk, rst;
	output [1:0]sel;
	
	reg [1:0]sel;
	reg [7:0]count;
	always@(posedge divided_clk or posedge rst)begin
	   if     (rst)sel<=2'b00;
		else if(count==0)sel<=sel+2'd1;
		else    sel<=sel;
   end
	always@(posedge divided_clk)begin
		count=count+8'd1;
	end

endmodule
