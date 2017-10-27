module ALU_8(A,B,S,C_7,F,Cout,overflow);
  input  [31:28]A;
  input  [31:28]B;
  input  [2:0]S;
  input  C_7;
  output signed [31:28]F;
  output Cout,overflow;
  reg  signed   [31:28]F;
  reg    Cout,overflow;
  reg    G,P;

  always@(C_7,G,P) 
   begin
    Cout=G+P*C_7;
  
    overflow=Cout^A[31]^B[31]^F[31];
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