module ALU(
	output reg[15:0] Upper,
	output reg[15:0] Lower,
	output reg[1:0] Zero,
	output reg Overflow,
	input [15:0] Data1,
	input [15:0] Data2,
	input [3:0] ALUOp
);

always@(*)
begin
	if(ALUOp == 4'b0000)  //Signed Add
	begin
		if((16'hFFFF - Data1) < Data2)
			Overflow = 1'b1;
		else
		begin
			Overflow = 1'b0;
			Lower = Data1 + Data2;
		begin
	end
	else if(ALUOp == 4'b0001)  //Signed Sub
	begin
		if((16'hFFFF + Data1) < Data2)
			Overflow = 1'b1;
		else
		begin
			Overflow = 1'b0;
			Lower = Data1 - Data2;
		begin
	end
	else if(ALUOp == 4'b0100)  //Signed Mul
		if((32'hFFFFFFFF / Data1) < Data2)
			Overflow = 1'b1;
		else
		begin
			Overflow = 1'b0;
			Lower = Data1 * Data2;
		begin
	else if(ALUOp == 4'b0101)  //Signed Div
	begin
		Overflow = 1'b0;
		Lower = Data1 / Data2;
		Upper = Data1 % Data2;
	end
	else if(ALUOp == 4'b0111)  //Move
	begin
		Overflow = 1'b0;
		Lower = Data2;
	end
	else if(ALUOp == 4'b1000)  //Swap
	begin
		Overflow = 1'b0;
		Lower = Data2;
		Upper = Data1;
	end
	else if(ALUOp == 4'b1001)  //AND
	begin
		Overflow = 1'b0;
		Lower = Data1 & Data2;
	end
	else if(ALUOp == 4'b1011) //OR
	begin
		Overflow = 1'b0;
		Lower = Data1 | Data2;
	end
end

endmodule
