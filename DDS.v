module DDS(clk,phase_ctrl,DDS_out);
input clk;
input [7:0] phase_ctrl;
output [7:0] DDS_out;
reg [7:0]adr=0;
always @(posedge clk) begin
    adr=adr+phase_ctrl;
end

DDS_mem DM(adr,clk,DDS_out);

endmodule