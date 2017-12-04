module ALU(
	output reg[15:0] Upper,
	output reg[15:0] Lower,
	output reg[1:0] Zero,
	input [15:0] Data1,
	input [15:0] Data2,
	input [3:0] ALUOp
	//input clk,
	//input rst
);

always@(*)
begin
	if(ALUOp == 4'b0000)  //Signed Add
		Lower = Data1 + Data2;
	else if(ALUOp == 4'b0001)  //Signed Sub
		Lower = Data1 - Data2;
	else if(ALUOp == 4'b0100)  //Signed Mul
		Lower = Data1 * Data2;
	else if(ALUOp == 4'b0101)  //Signed Div
	begin
		Lower = Data1 / Data2;
		Upper = Data1 % Data2;
	end
	else if(ALUOp == 4'b0111)  //Move
		Lower = Data2;
	else if(ALUOp == 4'b1000)  //Swap
	begin
		Lower = Data2;
		Upper = Data1;
	end
	else if(ALUOp == 4'b1001)  //AND
		Lower = Data1 & Data2;
	else if(ALUOp == 4'b1011) //OR
		Lower = Data1 | Data2;
end

endmodule
