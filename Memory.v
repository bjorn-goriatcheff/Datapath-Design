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
reg[7:0] mem [99:0]; //reg[15:0] ?

//Combinatorial READ
always@(*)
begin
	Byte=mem[Addr+1];
	Word[15:8]=mem[Addr];
	Word[7:0]=mem[Addr+1];
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc=0;inc<N;inc=inc+1)
			mem[inc]<=8'h00;
		mem[16'h0000]<=8'h2B;
		mem[16'h0001]<=8'hCD;
		mem[16'h0002]<=8'h00;
		mem[16'h0003]<=8'h00;
		mem[16'h0004]<=8'h12;
		mem[16'h0005]<=8'h34;
		mem[16'h0006]<=8'hDE;
		mem[16'h0007]<=8'hAD;
		mem[16'h0008]<=8'hBE;
		mem[16'h0009]<=8'hEF;
	end
	if(MemW==2'b10)
	begin
		//store word at addr
		mem[Addr]<=WriteW[15:8];	
		mem[Addr+1]<=WriteW[7:0];
	end
	else if(MemW==2'b01)
	begin
		//store byte at addr
		mem[Addr+1]<=WriteB;
	end
	
end
endmodule
