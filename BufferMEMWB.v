module BufferMEMWB#(parameter S=15, N=3, C=1)
(
	output reg[S:0] OutWord,
	output reg[7:0] OutByte,
	output reg[S:0] OutCtrl,
	//forward out
	input [S:0] InWord,
	input [7:0] InByte,
	input [C:0] InCtrl,
	//forward in
	input clk,
	input rst
);
integer inc1;
reg[S:0]buff[N:0];
reg[C:0]ctrl;

//Combinatorial READ
always@(*)
begin
	OutWord=buff[0];
	OutByte=buff[1][7:0];
	//
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
		buff[0]=InWord;
		buff[1]=InByte;
		//
		ctrl=InCtrl;
	end
	
end
endmodule
