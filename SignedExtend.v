module SignedExtend(
	output reg[15:0] Extended,
	input [7:0] Unextended
);

always@(*)
begin
		Extended[7:0] = Unextended;
	if(Unextended < 0)
	begin
		Extended[15:8] = 8'b11111111;
	end
end

endmodule
