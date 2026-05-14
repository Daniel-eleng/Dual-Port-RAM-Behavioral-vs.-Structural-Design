`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 10:18:52 PM
// Design Name: 
// Module Name: FIFO8_8_tb
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


module FIFO8_8_tb;
    reg clk, rst, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    FIFO8_8 TEST(.clk(clk),
                 .rst(rst),
                 .wr_en(wr_en),
                 .rd_en(rd_en),
                 .data_in(data_in),
                 .data_out(data_out),
                 .full(full),
                 .empty(empty));

    always #5 clk = ~clk;

    initial begin
        {clk,rst,wr_en,rd_en,data_in} = 0;
        $monitor("data_in = %b | data_out = %b",data_in,data_out);
        @(negedge clk) rst = 1;
        @(negedge clk) rst = 0;
        @(negedge clk) wr_en = 1;
                       data_in = 1'b1;
        @(negedge clk) data_in = 4'b1011;
        @(negedge clk) data_in = 3'b110;
        @(negedge clk) data_in = 8'b10011101;
        @(negedge clk) data_in = 5'b10100;
        @(negedge clk) data_in = 2'b10;
        @(negedge clk) data_in = 7'b1111111;
        @(negedge clk) wr_en = 0;

        repeat(2) @(negedge clk);
        $display("The writing is finished | full = %b",full);

        @(negedge clk) rd_en = 1;
        wait(empty == 1);
        @(negedge clk);
        $display("The reading is finished | empty = %b",empty);
        rd_en = 0;

        #200;
        $finish;

    end

endmodule
