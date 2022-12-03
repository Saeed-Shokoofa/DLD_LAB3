module wave_gen(clk,phase_ctrl,func,wave);
input clk;
input [7:0] phase_ctrl;
input [2:0] func;
output [7:0]wave;
reg [15:0]n=0;
wire [7:0] triangle,square,reciprocal;
assign triangle=(n[15]==1'b1)?{~(n[14:7])}:{n[14:7]};
assign square=(n[15]==1'b1)?8'b11111111:8'b00000000;
wire [6:0]for_rec;
assign for_rec=(n[14:11]*n[14:11])>>1+n[14:11];
assign reciprocal={n[15],for_rec};
always @(posedge clk)  begin
    n=n+1;
end

always @(*) begin
    case(func)
    3'b000:wave=reciprocal;
    3'b001:wave=square;
    3'b010:wave=triangle;
    3'b011:wave=sine;
    3'b100:wave=full_rec;
    3'b101:wave=half_rec;
    3'b110:wave=DDS;
end
endmodule