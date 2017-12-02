module AdderBr(
	output reg[3:0] Next,
	input [3:0] Addr,
	input [3:0] Offset,
	input clk,
	input rst
);

always@(*)
begin
	Next = Addr + Offset;
end

endmodule