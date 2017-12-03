module Memory#(parameter N=999)
(
	output reg[7:0] Byte,
	output reg[15:0] Word,
	input [15:0] Addr,
	input [15:0] WriteW,
	input [7:0] WriteB,
	input [1:0] MemW,
	input clk,
	input rst
);
integer inc;
reg[15:0] mem [15:0]; //reg[7:0] ?

//Combinatorial READ
always@(*)
begin
	Word=mem[Addr];
	Byte=mem[Addr][7:0];
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc=0;inc<N;inc=inc+1)
			mem[inc]<=16'h0000;
	end
	if(MemW==2'b10)
	begin
		//store word at addr
		mem[Addr]<=WriteW;	
	end
	else if(MemW==2'b01)
	begin
		//store byte at addr
		mem[Addr][7:0]<=WriteB;
	end
	
end
endmodule
