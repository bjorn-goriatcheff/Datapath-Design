module BufferIDEX#(parameter S=15, N=7, C=3)
(
	output reg[S:0] OutData1,
	output reg[S:0] OutData2,
	output reg[S:0] OutData15,
	output reg[S:0] OutCtrl,
	input [S:0] InData1,
	input [S:0] InData2,
	input [S:0] InData15,
	input [C:0] InCtrl,
	input clk,
	input rst
);
integer inc1;
reg[S:0]buff[N:0];
reg[C:0]ctrl;

//Combinatorial READ
always@(*)
begin
	OutData1=buff[0];
	OutData2=buff[1];
	OutData15=buff[2];
	OutCtrl=ctrl;
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc1=0;inc1<N;inc1=inc1+1)
			buff[inc1]<=16'h0000;
	end
	else
	begin
		buff[0]=InData1;
		buff[1]=InData2;
		buff[2]=InData15;
		ctrl=InCtrl;
	end
	
end
endmodule
