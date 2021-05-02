`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 12:08:51
// Design Name: 
// Module Name: RollingDisplay
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


module RollingDisplay(
    input set, s0, s1,
    input clk,
    input nCLR,
    output DP,
    output [7:0] AN,
    output [6:0] digits
    );
    wire CP;
    reg [2:0] S;
    reg [3:0] code;
    reg [31:0] c;
    assign DP = 1'b1;
    
    divider #(25000000) div0(clk, nCLR, CP);
    divider #(104166) div1(clk, nCLR, CP1);
    decoder3_8 dec(S, AN, 1'b0);
    code2digits c2d(code, digits);
    
    always @ (posedge CP1, negedge nCLR)
        if (~nCLR)
            S <= 3'b000;
        else
            S = S + 1'b1;
    
    always @ (*)
        case(S)
            3'b000: code = c[3:0];
            3'b001: code = c[7:4];
            3'b010: code = c[11:8];
            3'b011: code = c[15:12];
            3'b100: code = c[19:16];
            3'b101: code = c[23:20];
            3'b110: code = c[27:24];
            3'b111: code = c[31:28];
        endcase
    
    always @ (posedge CP, posedge set) begin
        if (set && ~s0 && ~s1)
            c <= 32'h00012334;
        else if (set && s0 && ~s1)
            c <= 32'h00000015;
        else if (set && ~s0 && s1)
            c <= 32'h00001616;
        else if (set && s0 && s1)
            c <= 32'h00012126;
        else begin
            c[3:0] <= c[31:28];
            c[31:4] <= c[27:0];
        end
    end
endmodule
