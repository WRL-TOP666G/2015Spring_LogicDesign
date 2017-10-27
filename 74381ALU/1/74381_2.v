module ALU_2(A,B,S,C_1,F,G,P,C_2);
  input  [7:4]A;
  input  [7:4]B;
  input  [2:0]S;
  input  C_1;
  output  signed [7:4]F;
  output G,P,C_2;
  reg signed   [7:4]F;
  reg    C_2;
  reg    G,P;
  always@(C_1,G,P) 
   begin
    C_2=G+P*C_1;
  

   end
  
 always@(S or A or B)
 begin
   case(S)
     3'b000: begin F=4'b0000  ;G=1'b1       ;P=1'b1    ; end
     3'b001: begin F=B-A      ;G=~(~A&~B|A) ;P=~(A&~B) ; end
     3'b010: begin F=A-B      ;G=~(~A|A&B)  ;P=~(~A&B) ; end
     3'b011: begin F=A+B      ;G=~(~A|A&~B) ;P=~(~A&~B); end
     3'b100: begin F=A^B      ;G=~(A^B)     ;P=~(~A&B) ; end
     3'b101: begin F=A|B      ;G=~(A|B)     ;P=~(A^B)  ; end
     3'b110: begin F=A&B      ;G=~B         ;P=~(~A&B) ; end
     3'b111: begin F=4'b1111  ;G=1'b0       ;P=(A&B)   ; end
   endcase
 end
 

   
   
endmodule