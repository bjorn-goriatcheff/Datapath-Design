module AdderBr#(parameter N=15)
(	output reg[N:0] Next,
	input [N:0] Addr,
	input [N:0] Offset
);

always@(*)
begin
	Next = Addr + Offset;
end

endmodule
