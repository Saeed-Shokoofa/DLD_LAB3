module TestBench();
reg clk=0;
wire[7:0] wave;
reg [7:0]phase_ctrl;
reg[2:0]func;
always #10 clk=~clk;
wave_gen WG(clk,phase_ctrl,func,wave);
initial begin
    #5 phase_ctrl=8'd3;
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