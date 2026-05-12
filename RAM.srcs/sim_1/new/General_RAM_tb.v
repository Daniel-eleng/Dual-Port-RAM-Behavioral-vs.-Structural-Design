`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2026 06:03:35 PM
// Design Name: 
// Module Name: General_RAM_tb
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


module General_RAM_tb;
    reg clk, rst, w_enb;
    reg [2:0] w_addr, rd_addr;
    reg [7:0] data_in;
    wire [7:0] data_out_classic, data_out_decoder;

    Classic_RAM8_8 TEST_classic(.clk(clk)
                       ,.rst(rst)
                       ,.w_enb(w_enb)
                       ,.w_addr(w_addr)
                       ,.rd_addr(rd_addr)
                       ,.data_in(data_in)
                       ,.data_out(data_out_classic));
        
    Decoder_RAM8_8 TEST_decoder(.clk(clk)
                       ,.rst(rst)
                       ,.w_enb(w_enb)
                       ,.w_addr(w_addr)
                       ,.rd_addr(rd_addr)
                       ,.data_in(data_in)
                       ,.data_out(data_out_decoder));


    always #5 clk = ~clk;

    initial begin
        $display("Out_Address=%d | Out_Classic=%b | Out_Decod=%b", rd_addr, data_out_classic, data_out_decoder);
        {clk , rst , w_enb , w_addr , rd_addr , data_in} = 0;
        $display("Out_Address=%d | Out_Classic=%b | Out_Decod=%b", rd_addr, data_out_classic, data_out_decoder);
        @(negedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
        @(negedge clk) w_enb = 1'b1;
        w_addr = 3'd0; 
        data_in = 8'b01101011; 
        @(negedge clk);
        w_addr = 3'd1; 
        data_in = 8'b10001110; 
        @(negedge clk);
        w_addr = 3'd6; 
        data_in = 8'b10011011; 
        @(negedge clk);
        w_enb = 1'b0;
        @(negedge clk);
        rd_addr = 3'd0;
        @(negedge clk);
        $display("Out_Address=%d | Out_Classic=%b | Out_Decod=%b", rd_addr, data_out_classic, data_out_decoder);
        rd_addr = 3'd1;
        @(negedge clk);
        $display("Out_Address=%d | Out_Classic=%b | Out_Decod=%b", rd_addr, data_out_classic, data_out_decoder);
        rd_addr = 3'd6;
        @(negedge clk);
        $display("Out_Address=%d | Out_Classic=%b | Out_Decod=%b", rd_addr, data_out_classic, data_out_decoder);
        #50;
        $finish;
    end
endmodule
