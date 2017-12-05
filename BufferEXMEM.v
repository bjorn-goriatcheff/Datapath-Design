module BufferEXMEM#(parameter S=15, N=4, C=1)
(
	output reg[S:0] OutUpper,
	output reg[S:0] OutLower,
	output reg[S:0] OutWord,
	output reg[7:0] OutByte,
	output reg[C:0] OutCtrl,
	//forward out
	input [S:0] InLower,
	input [S:0] InUpper,
	input [S:0] InWord,
	input [7:0] InByte,
	//forward in
	input [C:0] InCtrl,
	input clk,
	input rst
);
//integer inc1;
//reg[S:0]buff[N:0];
//reg[C:0]ctrl;

//Combinatorial READ
always@(*)
begin
	OutUpper=InUpper;
	OutLower=InLower;
	OutWord=InWord;
	OutByte=InByte;
	OutCtrl=InCtrl;
end

/*Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc1=0;inc1<N;inc1=inc1+1)
			buff[inc1]<=16'h0000;
	end
	else
	begin
		buff[0]=InUpper;
		buff[1]=InLower;
		buff[2]=InWord;
		buff[3]=InByte;
		//
		ctrl=InCtrl;
	end
	
end*/
endmodule
