module PC#(parameter N=15)
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
		out=16'h0000;
	end
	else
	begin
		out=add;
	end
end
endmodule
