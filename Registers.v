module Registers(
	output reg[15:0] Data1,
	output reg[15:0] Data2,
	output reg[15:0] Data15,
	input [3:0] ReadAdd1,
	input [3:0] ReadAdd2,
	input [3:0] WriteReg1,
	input [3:0] WriteReg2,
	input WriteDst,
	input clk,
	input rst
);
//15 Registers
reg[15:0]Reg [15:0];

//Combinatorial READ
always@(*)
begin





end

//Sequential Write
always@(posedge clk, negedge rst)
begin





end



endmodule
