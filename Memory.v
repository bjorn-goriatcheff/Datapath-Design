module Memory(
	output reg[8:0] Byte,
	output reg[15:0] Word,
	input [3:0] ReadAdd,
	input [8:0] WriteByte,
	input [15:0] WriteWord,
	input [1:0] MemW,
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	
end

//Sequential Write
always@(posedge clk, negedge rst)
begin
	if(!rst)
	
	
end
endmodule