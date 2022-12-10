module counter(clk,pl,rst,out,co);
input clk,rst;
input [1:0]pl;
output reg [7:0] out;
output co;
always @(posedge clk,posedge rst) begin
if(rst)
    out=0;
else begin 
    if(co)
        out=0;
    else begin
        out=out+pl;
    end
end
end
assign co=(&out);
endmodule