module counter(clk,pl,rst,out,co);
input clk,rst;
input [2:0]pl;
output reg [8:0] out;
output co;
always @(posedge clk,posedge rst) begin
if(rst)
    out={6'b0,pl};
else begin 
    if(co)
        out={6'b0,pl};
    else begin
        out=out+1;
    end
end
end
assign co=(&out);
endmodule