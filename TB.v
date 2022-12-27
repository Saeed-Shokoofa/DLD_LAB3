module TestBench();
reg clk=0;
wire[7:0] wave;
reg [7:0]phase_ctrl;
reg[2:0]func;
reg rst,ld;
reg [2:0]pl;
always #10 clk=~clk;
wave_gen WG(clk,func,wave);
freq_dev fd(clk,rst,pl,ld,clk_o,cnt);
initial begin
    #5 phase_ctrl=8'd3;
    #20 {pl,ld}=4'b0;
    #20 rst=1'b1;
    #20 rst=1'b0;
    #10 func=3'b000;
    #100000 func=3'b001;
    #100000 func=3'b010;
    #100000 func=3'b011;
    #100000 func=3'b100;
    #100000 func=3'b101;
    #100000 func=3'b110;
    #100000 func=3'b001;
end
endmodule