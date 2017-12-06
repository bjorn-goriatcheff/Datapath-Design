module Gather(
	output reg[15:0] OUT,
	input WB,
	input [1:0]DEST,
	input MBY,
	input MEMF,
	input DOWN,
	input [1:0]MEMW,
	input FDST,
	input MV1,
	input OFFSET,
	input IMM,
	input [3:0] AOP
);
always@(*)
begin
	OUT[0]=WB;
	OUT[2:1]=DEST;
	OUT[3]=MBY;
	OUT[4]=MEMF;
	OUT[5]=DOWN;
	OUT[7:6]=MEMW;
	OUT[8]=FDST;
	OUT[9]=MV1;
	OUT[10]=OFFSET;
	OUT[11]=IMM;
	OUT[15:12]=AOP;

end
endmodule
