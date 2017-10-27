`timescale 1ns/1ps
module testbench;
    reg  [31:0]A,B; 
    reg  [2:0]S; 
    reg   C_in;
          
    wire [31:0]F;
    wire Cout;
    wire overflow;
    
system s1(A,B,C_in,S,C_in,F,Cout,overflow);
 
    initial
    begin
        #1000            
        $stop;         
    end

  

    initial begin
          C_in = 1'b0;
          A = 32'd20;
          B = 32'd19;
          S = 3'b000;
          
        #1;  
          A = 32'd16;
          B = 32'd08;
          S = 3'b010;
          
        #1;  
          A = 32'd22;
          B = 32'd13;
          S = 3'b110;
          
        #1;  
          A = 32'd29;
          B = 32'd31;
          S = 3'b101;
          
        #1;  
          A = 32'd26;
          B = 32'd30;
          S = 3'b111;
          
        #1;  
          A = 32'd11;
          B = 32'd31;
          S = 3'b000;
          
        #1;  
          A = 32'd04;
          B = 32'd19;
          S = 3'b100;
          
        #1;  
          A = 32'd24;
          B = 32'd27;
          S = 3'b011;
   
               
        $finish;

    end
    
    
    initial
    begin                                
                  
       $monitor($time, "A=%d,B=%d,S=%b,F=%d,Cout=%b,overflow=%b"
                 ,A,B,S,F,Cout,overflow);   
    end

endmodule
