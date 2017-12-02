module ALUControl(
	output reg[3:0] ALUop,
	input [3:0] FunctCode,
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	ALUop = FunctCode;  //?
end
endmodule