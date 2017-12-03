module PC#(parameter N=7)
(
	output reg[N:0] out,
	input [N:0]add,
	input clk,
	input rst
);
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		out=8'h00;
	end
	else
	begin
		out=add;
	end
end
endmodule
