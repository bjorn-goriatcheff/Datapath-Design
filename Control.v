module Control(
	output reg Halt,
	output reg[1:0] Branch,
	output reg Writedst,
	output reg SRC15,
	output reg[1:0] ALUsrc1,
	output reg OFFset,
	output reg[1:0] ALUsrc2,
	output reg Imm,
	output reg MV1src,
	output reg Down,
	output reg MemW,
	output reg Mbyte,
	input [3:0] OpCode,
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	if(OpCode == 1111) //Type A
	begin
	Halt=0
	Branch=2'b01
	Writedst=
	SRC15=
	ALUsrc1=2'b00
	OFFset=0
	ALUsrc2=2'b00
	Imm=0
	MV1src=1 //?
	Down= 0
	MemW= 
	Mbyte= 0
	end
end
endmodule