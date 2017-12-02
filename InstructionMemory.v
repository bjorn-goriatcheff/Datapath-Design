module InstructionMemory(
	output reg[3:0] Addr1,
	output reg[3:0] Addr2,
	output reg[3:0] Control, //?
	output reg[8:0] Word,	//?
	input [3:0] ReadAdd,
	input clk,
	input rst
);
integer count1;

//Combinatorial READ
always@(*)
begin
	//Convert Hex address to 16 bits
	count1=16'b0;
	count1=ReadAdd;
	Addr1=count1[11:8]; 
	Addr2=count1[7:4]; 
	Control=count1[3:0]; 
	Word=count1[7:0]; 
end
endmodule