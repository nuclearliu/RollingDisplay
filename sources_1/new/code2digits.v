`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/01 20:38:33
// Design Name: 
// Module Name: code2digits
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


module code2digits(input [4:0] code, output reg [6:0] digits);
    always @ (code)
    case(code)
        0: digits <= 7'b1111111; //nothing
        1: digits <= 7'b0001001; //h
        2: digits <= 7'b0000110; //e
        3: digits <= 7'b1000111; //l
        4: digits <= 7'b1000000; //o
        5: digits <= 7'b1111001; //i
        6: digits <= 7'b0001000; //a
        7: digits <= 7'b1111000;
        8: digits <= 7'b0000000;
        9: digits <= 7'b0010000;
        'hA: digits <= 7'b0001000;
        'hB: digits <= 7'b0000011;
        'hC: digits <= 7'b0100111;
        'hD: digits <= 7'b0100001;
        'hE: digits <= 7'b0000110;
        'hF: digits <= 7'b0001110;
        default: digits <= 7'b0100011;
    endcase
endmodule
