`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: 
// 
// Create Date: 08/21/2021 08:37:16 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu #(parameter ancho=4)(
   input [ancho-1:0]A, B,
   input ALUFlagIN, 
   input [3:0]ALUControl,
   output reg [ancho-1:0]ALUResult, 
   output reg ALUFlags
    );
    wire [ancho-1:0]Neg;
    wire [ancho-1:0]LS;
    wire [ancho-1:0]RS;
    wire [ancho-1:0]S1;
    wire [ancho-1:0]R1;
    wire [ancho-1:0]C;
    
    N U1(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(Neg));
    Sum1 U2(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(S1));
    Res1 U3(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(R1));
    LShift U4(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(LS), .aluflags(C));
    RShift U5(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(RS), .aluflags(C));
    
    always @(*) begin
        case(ALUControl)
            4'h0: ALUResult=A&B;//AND
               
            4'h1: ALUResult=A|B;//OR
               
            4'h2: 
                begin
                   
                end
            4'h3: ALUResult=S1;//INCREMENTO EN 1
      
            4'h4: ALUResult=R1;//DECREMENTO EN 1
              
            4'h5: ALUResult=Neg;//NEGACIÓN
            
            4'h6:
                begin
                
                end
            4'h7: ALUResult=A^B;//XOR
               
            4'h8: 
                begin //LEFT SHIFT
                     ALUResult = LS;
                     ALUFlags = C;              
                end
            4'h9:
                begin  //RIGHT SHIFT             
                     ALUResult = RS;
                     ALUFlags = C;             
                end
            default ALUFlags=1'bx;
        endcase
    end
endmodule
