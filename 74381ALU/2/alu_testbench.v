
`timescale 1ns/1ps
module alu_testbench;
    reg  [31:0] A,B; 
    reg  [2:0] S; 
    reg   C_in;
          
    wire [31:0]F;
    wire Cout;
    wire overflow;
  
ALU s1(A,B,S,C_in,F,G,P,Cout,overflow);


    initial
    begin
        #20            
        $stop;         
    end



    initial begin
          C_in = 1'b0;
          A = 32'd20;
          B = 32'd19;
          S = 3'd1;
          
        #1;  
          A = 32'd16;
          B = 32'd08;
          S = 3'd3;
          
        #1;  
          A = 32'd22;
          B = 32'd13;
          S = 3'd7;
          
        #1;  
          A = 32'd29;
          B = 32'd31;
          S = 3'd5;
          
        #1;  
          A = 32'd26;
          B = 32'd30;
          S = 3'd2;
          
        #1;  
          A = 32'd11;
          B = 32'd31;
          S = 3'd1;
          
        #1;  
          A = 32'd04;
          B = 32'd19;
          S = 3'd6;
          
        #1;  
          A = 32'd24;
          B = 32'd27;
          S = 3'd1;
   
               
        $finish;

    end
    
    
    initial
    begin                                
                  
       $monitor($time, "A=%d,B=%d,S=%d,F=%d,Cout=%b,overflow=%b"
                 ,A,B,S,F,Cout,overflow);   
    end

endmodule
