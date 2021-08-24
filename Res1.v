`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2021 10:44:09 PM
// Design Name: 
// Module Name: Res1
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


module Res1 #(parameter ancho=4)(
    input [ancho-1:0]a, b, 
    input aluflagin,
    output reg [ancho-1:0]aluresult, 
    output reg aluflags
    );
    
    always @(*) begin
        case(aluflagin)
            1'b0: aluresult=a-1;
            1'b1: aluresult=b-1;
        endcase
    end
endmodule
