module ALU(A,B,S,C_in,F,G,P,Cout,overflow);
    input  [31:0]A;
    input  [31:0]B;
    input  [2:0]S;
    input  C_in;
    output [31:0]F;
    output G,P,Cout,overflow;

    reg  signed  [31:0]F;
    reg    G,P,Cout,overflow;
    
    
   always@(*) 
   begin
     Cout=G+P*C_in;
     overflow=Cout^A[31]^B[31]^F[31];
   end
  
  
  
 always@(S or A or B)
 begin
   case(S)
     3'b000: begin F=32'd0  ;G=1'b1                  ;P=1'b1            ; end
     3'b001: begin F=B-A    ;G=~(~A[31]&~B[31]|A[31]);P=~(A[31]&~B[31]) ; end
     3'b010: begin F=A-B    ;G=~(~A[31]|A[31]&B[31]) ;P=~(~A[31]&B[31]) ; end
     3'b011: begin F=A+B    ;G=~(~A[31]|A[31]&~B[31]);P=~(~A[31]&~B[31]); end
     3'b100: begin F=A^B    ;G=~(A[31]^B[31])        ;P=~(~A[31]&B[31]) ; end
     3'b101: begin F=A|B    ;G=~(A[31]|B[31])        ;P=~(A[31]^B[31])  ; end
     3'b110: begin F=A&B    ;G=~B[31]                ;P=~(~A[31]&B[31]) ; end
     3'b111: begin F=32'd31 ;G=1'b0                  ;P=(A[31]&B[31])   ; end
   endcase
 end
  
endmodule
