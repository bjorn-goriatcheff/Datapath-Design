module ALU(
	output reg[16:0] Upper,
	output reg[16:0] Lower,
	output reg[1:0] Zero;
	input [16:0] Data1,
	input [16:0] Data2,
	input [3:0] ALUOp,
	input clk,
	input rst
);

always@(*)
begin
	if(ALUOp == 4'b0000)
		Upper = Data1 + Data2;
	if(ALUOp == 4'b0001)
		Upper = Data1 - Data2;
	if(ALUOp == 4'b0100)
		Upper = Data1 * Data2;
	if(ALUOp == 4'b0101)
		Upper = Data1 / Data2;
	if(ALUOp == 4'b0111)
	begin
	end
	if(ALUOp == 4'b1000)
	begin
	end
	if(ALUOp == 4'b1001)
	begin
	end
	if(ALUOp == 4'b1011)
	begin
	end
end

endmodule