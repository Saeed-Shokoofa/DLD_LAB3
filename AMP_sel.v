module amplitude_selector(in,sel,out);
input [7:0] in;
input [1:0] sel;
output [7:0] out;

// case(sel)
//     2'b00:assign out=in;
//     2'b01:assign out={{2{in[7]}},in[6:1]};
//     2'b10:assign out={{3{in[7]}},in[6:2]};
//     2'b11:assign out={{4{in[7]}},in[6:3]};
// endcase

assign out=(sel==2'b00)?in:
    (sel==2'b01)?{{2{in[7]}},in[6:1]}:
    (sel==2'b10)?{{3{in[7]}},in[6:2]}:
    (sel==2'b11)?{{4{in[7]}},in[6:3]}:in;

endmodule