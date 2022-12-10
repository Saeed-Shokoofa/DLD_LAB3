module wave_gen(clk,func,wave);
input clk;
// input [7:0] phase_ctrl;
input [2:0] func;
output reg[7:0]wave;
reg [7:0]n=0;
wire [7:0] triangle,square,reciprocal,DDS_out,half_rec;
wire[7:0]full_rec;
reg [15:0]cur_sin,past_sin=0,cur_cos,past_cos=16'd30000;
wire[7:0] sinus;

assign sinus=cur_sin[15:8]+8'd127;
assign triangle=(n[7]==1'b1)?{{~(n[6:0]),1'b0}}:{n[6:0],1'b0};
assign square=(n[7]==1'b1)?8'b11111111:8'b00000000;
assign full_rec=cur_sin[15:8]+8'd127;
assign half_rec=cur_sin[15:8]+8'd127;

wire [6:0]for_rec;
assign for_rec=(n[6:3]*n[6:3])>>1+n[6:3];
assign reciprocal=8'd255/(8'd255-n[7:0]);
always @(posedge clk)  begin
    n=n+1;
    cur_sin=past_sin+{{6{past_cos[15]}},past_cos[15:6]};
    cur_cos=past_cos-{{6{cur_sin[15]}},cur_sin[15:6]};
    past_cos=cur_cos;
    past_sin=cur_sin;
end

// always @(posedge n[7]) begin
//     cur_sin=past_sin+{{6{past_cos[15]}},past_cos[15:6]};
//     cur_cos=past_cos-{{6{cur_sin[15]}},cur_sin[15:6]};
//     past_cos=cur_cos;
//     past_sin=cur_sin;
// end

// DDS DDS1(clk,phase_ctrl,DDS_out);

always @(*) begin
    case(func)
    3'b000:wave=reciprocal;
    3'b001:wave=square;
    3'b010:wave=triangle;
    3'b011:wave=cur_sin[15:8]+8'd127;
    3'b100:wave=(full_rec<8'd128)?(8'd255-full_rec):full_rec;
    3'b101:wave=(half_rec<8'd128)?8'd127:half_rec;
    // 3'b110:wave=DDS_out;
    endcase
end
endmodule