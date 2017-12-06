module BufferIFID#(parameter S=15)
(
	output reg[S:0] OutInstr,
	input [S:0] InInstr,
	input ctrl,
	//flush/hazard
	input clk,
	input rst
);
reg [S:0]mem;

always@(*)
begin
	 OutInstr = mem;
end
always@(posedge clk, negedge rst)
begin
	if(!rst)
		mem=15'h0000;
	if(!ctrl)
	begin
		mem=15'h0000;
		OutInstr=15'h0000;
	end
	else
	begin
		mem  = InInstr;
	end
end
endmodule
