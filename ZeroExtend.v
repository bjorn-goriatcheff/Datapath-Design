module ZeroExtend(
	output reg[15:0] Extended,
	input [7:0] Unextended
);

always@(*)
begin
	Extended[7:0] = Unextended;
end

endmodule
