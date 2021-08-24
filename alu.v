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
    wire [ancho-1:0]CL;
    wire [ancho-1:0]CR;
    wire [ancho-1:0]CLA_SUM;
    wire [ancho-1:0]RES;
    wire Carrysuma;
    wire Carryresta;
    
    N U1(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(Neg));
    Sum1 U2(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(S1));
    Res1 U3(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(R1));
    LShift U4(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(LS), .aluflags(CL));
    RShift U5(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(RS), .aluflags(CR));
    CLA_4bits U6(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(CLA_SUM), .aluflags(Carrysuma));
    Substraction U7(.a(A), .b(B), .aluflagin(ALUFlagIN), .aluresult(RES), .aluflags(Carryresta));
    
    always @(*) begin
        case(ALUControl)
            default ALUFlags=1'bx;
            4'h0: ALUResult=A&B;//AND
               
            4'h1: ALUResult=A|B;//OR
               
            4'h2: 
                begin
                   ALUResult=CLA_SUM;
                   ALUFlags=Carrysuma;
                end
            4'h3: ALUResult=S1;//INCREMENTO EN 1
      
            4'h4: ALUResult=R1;//DECREMENTO EN 1
              
            4'h5: ALUResult=Neg;//NEGACIÓN
            
            4'h6:
                begin
                    ALUResult=RES;
                    ALUFlags=Carryresta;
                end
            4'h7: ALUResult=A^B;//XOR
               
            4'h8: 
                begin //LEFT SHIFT
                     ALUResult = LS;
                     ALUFlags = CL;              
                end
            4'h9:
                begin  //RIGHT SHIFT             
                     ALUFlags = CR; 
                     ALUResult = RS;            
                end
        endcase
    end
endmodule
