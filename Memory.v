module Memory(
	output reg[7:0] Byte,
	output reg[15:0] Word,
	input [15:0] op1,
	input [15:0] op2,
	input [15:0] immd,
	input [1:0] MemW,
	input clk,
	input rst
);
integer inc, inc1, inc2, count1, count2;
reg[7:0] mem [99:0];

//Combinatorial READ
always@(*)
begin
	count1=immd;
	for(inc=0;inc<16;inc=inc+1)
		count1=count1+op2[inc]*(2**inc);
	Byte[7:0]=mem[count1];
	
	count2=immd;
	for(inc2=0;inc2<16;inc2=inc2+1)
		count2=count2+op2[inc2]*(2**inc2);
	Word[7:0]=mem[count2];
	Word[15:8]=mem[count2+1];
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc1=0;inc1<99;inc1=inc1+1)
			mem[inc1]<=0;
	end
	else if(MemW==2'b01)
	begin
		//store byte at addr
		mem[count1]<=op1[7:0];
	end
	else if(MemW==2'b10)
	begin
		//store word at addr
		mem[count2]<=op1[7:0];
		mem[count2+1]<=op1[15:8];	
	end
	
end
endmodule
