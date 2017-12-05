module BufferIFID#(parameter S=15, N=1, C=1)
(
	output reg[S:0] OutInstr,
	output reg[C:0] OutCtrl,
	input [S:0] InInstr,
	input InCtrl,
	//flush
	//hazard
	input clk,
	input rst
);

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin	
		OutInstr <= 16'h0000;
	end	
	//if(flush)
	else
	begin
		OutInstr = InInstr;
	end
end
endmodule
