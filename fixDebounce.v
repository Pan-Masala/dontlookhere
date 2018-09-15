`timescale 1ns / 1ps

module fixDebounce(
    input clk_deb,
    input pb_press,
    output deb_out
    );
    
    reg [2:0] ff;
    
    always@(posedge clk_deb)
    begin
        ff[2] <= pb_press;
        ff[1] <= ff[2];
        ff[0] <= ff[1];
    end
    
    assign deb_out = ff[2] & ff[1] & ff[0];
endmodule
