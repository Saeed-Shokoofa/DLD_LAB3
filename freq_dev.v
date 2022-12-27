module freq_dev(clk,rst,pl,ld,clk_o,cnt);
input clk,rst,ld;
input [2:0]pl;
output reg clk_o=0;
output reg[8:0]cnt;
reg tog=0;
always @(posedge clk,posedge rst)begin
    if(rst)
        cnt={6'b0,pl};
    else begin
        if(ld)
            cnt={6'b0,pl};
        else
            cnt=cnt+1;
				if(&(cnt))begin
					clk_o=~clk_o;
					cnt={6'b0,pl};
					end
    end
end

endmodule