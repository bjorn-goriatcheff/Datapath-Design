module Adder2#(parameter N=7)
	(output reg[N:0] add,
	input [N:0] pc
	);
always@(*)
begin
	add=pc+2;
end
endmodule
