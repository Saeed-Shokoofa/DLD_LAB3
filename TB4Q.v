`timescale 1 ns/ 1 ns
module TestBench();
reg clock=0;
wire[7:0] sig,wave_out;
wire [8:0]cnt_out;
wire clk_oout;
reg rst,ld;
reg [2:0] pl,func;
reg [1:0]phase,amp;
always #10 clock=~clock;
LAB3 LL(
	clk_oout,
	clock,
	rst,
	ld,
	pl,
	cnt_out,
	sig,
	func,
	phase,
	amp,
	wave_out);
initial begin
    #5 begin {func,rst,ld}=5'b0; pl=2'b0; phase=2'b0; amp=2'b0; end
    #10 rst=1'b1;
    #40 rst=1'b0;
    #500 func=3'b001;
    #500 func=3'b011;
    #500 func=3'b111;
    #500 func=3'b110;
    #500 phase=2'b01;
    #3000000 phase=2'b10;
    #3000000 phase=2'b11;
    #3000000 func=3'b010;
    #3000000 amp=2'b01;
    #3000000 amp=2'b10;
    #3000000 amp=2'b11;
end
endmodule