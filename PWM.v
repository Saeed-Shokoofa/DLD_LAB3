module PWM(clk,in,out);
input clk;
input [7:0]in;
reg [7:0]cnt=0;
output out;
always @(posedge clk)begin
    cnt=cnt+1;
end
assign out=(in>cnt)?1'b1:1'b0;
endmodule