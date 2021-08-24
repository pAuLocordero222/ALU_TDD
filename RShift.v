`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2021 05:54:14 PM
// Design Name: 
// Module Name: RShift
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


module RShift #(parameter ancho=4)(
    input [ancho-1:0]a, b, 
    input aluflagin,
    output reg [ancho-1:0]aluresult, 
    output reg aluflags
    );
    
    
    wire [0:ancho-1]ones;
    
    assign ones={(ancho-1){1'b1}};
    
     always @(*) begin
        case(aluflagin)
            1'b0: 
                begin
                    aluflags = a[b-1];
                    aluresult = (a >> b);
                end
            1'b1: 
                begin
                    aluflags = a[b-1];
                    aluresult = (a >> b)|(ones << (ancho-b));
                end      
        endcase
    end
endmodule
