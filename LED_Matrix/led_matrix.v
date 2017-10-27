`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:13 05/20/2015 
// Design Name: 
// Module Name:    led_matrix 
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
module led_matrix(divided_clk,rst,sel,row,column);
    input  divided_clk,rst,sel;
	 output [7:0]row,column;
	 
	 reg  [7:0]row,column;
	 
	 always@(posedge divided_clk or posedge rst)begin
	     if(rst)row<=8'b00000001;
		  else if(row==8'b10000000)row<=8'b00000001;
		  else row<=row<<1'b1;
    end
	 always@(*)begin
	 if(sel == 1'b1)
	 begin
	     case(row)
		     8'b00000001: column=8'b00011110;
           8'b00000010: column=8'b00100001;
           8'b00000100: column=8'b01000001;
           8'b00001000: column=8'b10000010;
           8'b00010000: column=8'b10000010;
           8'b00100000: column=8'b01000001;
           8'b01000000: column=8'b00100001;
           8'b10000000: column=8'b00011110;
           default:column=8'b00000000;
	     endcase
		  end

	 else
	 begin
		 case(row)
		     8'b00000001: column=8'b00011110;
           8'b00000010: column=8'b00100001;
           8'b00000100: column=8'b01000001;
           8'b00001000: column=8'b11010110;
           8'b00010000: column=8'b10101010;
           8'b00100000: column=8'b01000001;
           8'b01000000: column=8'b00100001;
           8'b10000000: column=8'b00011110;
           default:column=8'b00000000;
	     endcase
		  end
   end
		  
endmodule
