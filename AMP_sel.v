module amplitude_selector(in,sel,out);
input [7:0] in;
input [1:0] sel;
output [7:0] out;
//always @(*) begin
// case(sel)
//     2'b00: out=in;
//     2'b01: out={{2{in[7]}},in[6:1]};
//     2'b10: out={{3{in[7]}},in[6:2]};
//     2'b11: out={{4{in[7]}},in[6:3]};
 //endcase
//end
assign out=(sel==2'b00)?in:
    (sel==2'b01)?{2'b00,in[7:2]}:
    (sel==2'b10)?{3'b000,in[7:3]}:
    (sel==2'b11)?{4'b0000,in[7:4]}:in;

endmodule