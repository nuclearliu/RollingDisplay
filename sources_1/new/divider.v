`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/01 20:40:27
// Design Name: 
// Module Name: divider
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


module divider #(parameter n = 50000000)(input CLK, reset, output reg CP);
  integer counter;
  always @(posedge CLK, negedge reset)
    if (~reset) begin
      CP <= 0;
      counter <= 1;
    end
    else if (counter == n) begin
      counter <= 1;
      CP <= ~CP;
    end
    else
      counter <= counter + 1'b1;
endmodule