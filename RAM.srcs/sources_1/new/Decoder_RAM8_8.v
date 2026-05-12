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


module Decoder_RAM8_8(input clk, rst, w_enb, 
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
                 case (w_addr)
                    3'b000:RAM[0] <= data_in;
                    3'b001:RAM[1] <= data_in;
                    3'b010:RAM[2] <= data_in;
                    3'b011:RAM[3] <= data_in;
                    3'b100:RAM[4] <= data_in;
                    3'b101:RAM[5] <= data_in;
                    3'b110:RAM[6] <= data_in;
                    3'b111:RAM[7] <= data_in;
                    default: ;
                 endcase
            end
                case (rd_addr)
                    3'b000:data_out <= RAM[0];
                    3'b001:data_out <= RAM[1];
                    3'b010:data_out <= RAM[2];
                    3'b011:data_out <= RAM[3];
                    3'b100:data_out <= RAM[4];
                    3'b101:data_out <= RAM[5];
                    3'b110:data_out <= RAM[6];
                    3'b111:data_out <= RAM[7]; 
                    default: ;
                endcase
            end
        end
endmodule
