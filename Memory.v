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
integer inc, count1;

//Combinatorial READ
always@(*)
begin
	count1=0;
	count1=count1+ReadAdd[0];
	count1=count1+ReadAdd[1]*(2**1);
	count1=count1+ReadAdd[2]*(2**2);
	count1=count1+ReadAdd[3]*(2**3);
	Byte=count; //?
	
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc=0;inc<16;inc=inc+1) //?
			
	end
	else if(MemW==2'b01)
	begin
		//store byte at addr
		
	end
	else if(MemW==2'b10)
	begin
		//store word at addr
	
	end
	
end
endmodule