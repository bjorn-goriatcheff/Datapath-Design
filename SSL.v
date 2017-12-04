module SSL(
	output reg[15:0] Shifted,
	input [15:0] Unshifted
);

always@(*)
begin
	Shifted = Unshifted << 2;
end

endmodule
