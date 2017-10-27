module ALU_7(A,B,S,C_6,F,G,P,C_7);
  input  [27:24]A;
  input  [27:24]B;
  input  [2:0]S;
  input  C_6;
  output signed [27:24]F;
  output G,P,C_7;
  reg signed    [27:24]F;
  reg    C_7;
  reg    G,P;
  always@(C_6,G,P) 
   begin
    C_7=G+P*C_6;


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
