module ALU_CONTROL(
	output reg[3:0]ALUop,
	input [3:0]ctrl,
	input [3:0]func
);

always@(*)
begin
	case(ctrl)
		//ADD SUB MUL DIV MOVE SWAP
		4'b1111: ALUop = func;
		//ANDi
		4'b1000: ALUop = 4'b1001;
		//ORi
		4'b1001: ALUop = 4'b1011;
		//LBi
		4'b1010: ALUop = 4'b0000;
		//SBi
		4'b1011: ALUop = 4'b0000;
		//Lw
		4'b1100: ALUop = 4'b0000;
		//Sw
		4'b1101: ALUop = 4'b0000;
	endcase		

end
endmodule
