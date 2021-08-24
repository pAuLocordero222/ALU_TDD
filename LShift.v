`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: 
// 
// Create Date: 08/21/2021 10:47:43 PM
// Design Name: 
// Module Name: LShift
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


module LShift #(parameter ancho=4)(
    input [ancho-1:0]a, b, 
    input aluflagin,
    output reg [ancho-1:0]aluresult, 
    output reg aluflags
    );
    wire ShiftL;
    
     always @(*) begin
        case(aluflagin)
            1'b0: 
                begin
                    aluflags = a[ancho-b];
                    aluresult = a << b;
                end
            1'b1: 
                begin
                    aluflags = a[ancho-b];
                    ShiftL = (a << b);
                    aluresult = {A[ancho-1:0],1'b1};
                end      
        endcase
    end
endmodule
