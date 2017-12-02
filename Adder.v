module Adder(
	output reg[3:0] Next,
	input [3:0] Addr,
	input clk,
	input rst
);

always@(*)
begin
	Next = Addr + 2;
end

endmodule