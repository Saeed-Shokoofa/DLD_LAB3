module TestBench();
reg clk=0;
wire wave;
reg [7:0]phase_ctrl;
reg[2:0]func;
always #10 clk=~clk;
wave_gen WG(clk,phase_ctrl,func,wave);
initial begin
    #5 phase_ctrl=8'b0;
    #10 func=3'b000;
    #1000 func=3'b001;
    #1000 func=3'b010;
    #1000 func=3'b011;
    #1000 func=3'b100;
    #1000 func=3'b101;
    #1000 func=3'b110;
    #1000 func=3'b001;
end
endmodule