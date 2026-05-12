`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2026 05:10:49 PM
// Design Name: 
// Module Name: Classic_RAM8_8
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


module Classic_RAM8_8(input clk, rst, w_enb, 
                      input [2:0] w_addr, rd_addr,
                      input [7:0] data_in,
                      output reg [7:0] data_out);
    reg [7:0] RAM [0:7];
    integer i;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i = 0;i < 8;i = i + 1) begin
                RAM[i] <= 8'd0;
            end
            data_out <= 8'd0;
        end
        else begin
            if(w_enb) begin
                 RAM[w_addr] <= data_in;
            end
                data_out <= RAM[rd_addr];
        end
    end
endmodule
