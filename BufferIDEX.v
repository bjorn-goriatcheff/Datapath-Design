module BufferIDEX#(parameter S=15, C=2)
(
	output reg[S:0] OutData1,
	output reg[S:0] OutData2,
	output reg[S:0] OutData15,
	output reg[S:0] OutDataRS,
	output reg[S:0] OutDataRT1,
	output reg[S:0] OutDataRT2,
	output reg[S:0] OutDataRD,
	output reg[C:0] OutCtrl,
	input [S:0] InData1,
	input [S:0] InData2,
	input [S:0] InData15,
	input [S:0] InRS,
	input [S:0] InRT1,
	input [S:0] InRT2,
	input [S:0] InRD,
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
	OutData1=InData1;
	OutData2=InData2;
	OutData15=InData15;
	OutDataRS=InRS;
	OutDataRT1=InRT1;
	OutDataRT2=InRT2;
	OutDataRD=InRD;
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
		buff[0]<=InData1;
		buff[1]<=InData2;
		buff[2]<=InData15;
		buff[3]<=InRS;
		buff[4]<=InRT1;
		buff[5]<=InRT2;
		buff[6]<=InRD;
		ctrl<=InCtrl;
	end
	
end*/
endmodule
