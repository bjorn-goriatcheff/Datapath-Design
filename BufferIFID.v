module BufferIFID#(parameter S=15, N=1, C=1)
(
	output reg[S:0] OutInstr,
	output reg[S:0] OutCtrl,
	input [S:0] InInstr,
	input [C:0] InCtrl,
	//flush
	//hazard
	input clk,
	input rst
);
integer inc1;
reg[S:0]buff[N:0];
reg[C:0]ctrl;

//Combinatorial READ
always@(*)
begin
	OutInstr=buff[0];
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
		buff[0]=InInstr;
		ctrl=InCtrl;
	end
	//if(flush)
	
end
endmodule
