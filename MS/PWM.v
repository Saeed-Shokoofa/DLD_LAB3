module PWM(clk,in,out);
input clk;
input [7:0]in;
reg [7:0]cnt=0;
output reg out;
always @(posedge clk)begin
    if(cnt=<in)
        out=1'b1;
    else
        out=1'b0;
    cnt=cnt+1;
end
endmodule