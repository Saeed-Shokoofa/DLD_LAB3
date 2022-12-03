module wave_gen(clk,phase_ctrl,func,wave);
input clk;
input [7:0] phase_ctrl;
input [2:0] func;
output [8:0]wave;
always @(*) begin
    case(func)
    3'b000:
    3'b001:
    3'b010:
    3'b011:
    3'b100:
    3'b101:
    3'b110:
end
endmodule