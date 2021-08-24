`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2021 07:45:30 PM
// Design Name: 
// Module Name: CLA_4bits
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


module CLA_4bits #(parameter ancho=4)(
    input [ancho-1:0]a, b, 
    input aluflagin,
    output wire [ancho-1:0]aluresult, 
    output wire aluflags
    );
    
    wire x1;
    wire x2;
    wire x3; 
    wire x4;
    wire x5;
    wire x6;
    wire x7;
    wire x8;
    wire x9;
    
    assign x1=~aluflagin;
    assign x2=~(a[0]|b[0]);
    assign x3=~(a[0]&b[0]);
    assign x4=~(a[1]|b[1]);
    assign x5=~(a[1]&b[1]);
    assign x6=~(a[2]|b[2]);
    assign x7=~(a[2]&b[2]);
    assign x8=~(a[3]|b[3]);
    assign x9=~(a[3]&b[3]);
    
    assign aluresult[0]=~x1^(~x2&x3);
    assign aluresult[1]=~((x1&x3)|x2)^(~x4&x5);
    assign aluresult[2]=~((x1&x3&x5)|(x5&x2)|x4)^(~x6&x7);
    assign aluresult[3]=~((x1&x3&x5&x7)|(x5&x7&x2)|(x7&x4)|x6)^(~x8&x9);
    assign aluflags=~((x1&x3&x5&x7&x9)|(x5&x7&x9&x2)|(x7&x9&x4)|(x9&x6)|x8);
  
   
    
endmodule
