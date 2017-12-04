module BufferMEMWB#(parameter S=15, N=3, C=1)
(
	output reg[S:0] OutWord,
	output reg[7:0] OutByte,
	output reg[S:0] OutCtrl,
	//forward out
	input [S:0] InWord,
	input [7:0] InByte,
	input [S:0] InCtrl,
	//forward in
	input clk,
	input rst
);
integer inc1;// inc2, inc3, inc4, inc5, f1;
reg[S:0]buff[N:0];
reg[S:0]ctrl[C:0];

//Combinatorial READ
always@(*)
begin
	OutWord=buff[0];
	OutByte=buff[1][7:0];
	//
	OutCtrl=ctrl[0];
	/*Receive first slot in array; shift down
	OutInstr=buff[0];
	for(inc3=1;inc3<N;inc3=inc3+1)
	begin
		buff[inc3]=buff[inc3+1];
	end
	buff[N]=16'h0000;

	OutCtrl=ctrl[0];
	for(inc4=0;inc4<C;inc4=inc4+1)
	begin
		ctrl[inc4]=ctrl[inc4+1];
	end
	ctrl[C]=16'h0000;*/
end

//Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		/*for(inc1=0;inc1<N;inc1=inc1+1)
			buff[inc1]<=16'h0000;
		for(inc1=0;inc1<C;inc1=inc1+1)
			ctrl[inc1]<=16'h0000;*/
	end
	else
	begin
		//Search for next empty slot in the array
		buff[0]=InWord;
		buff[1]=InByte;
		//
		ctrl[0]=InCtrl;
		/*f1=16'h0000;
		for(inc2=0;inc2<N;inc2=inc2+1)
		begin
			if(buff[inc2]==16'h0000)
			begin
				if(f1!=16'hFFFF)
				begin
					buff[inc2]=InInstr;
					f1=16'hFFFF;
				end
			end
		end

		f1=16'h0000;
		for(inc5=0;inc5<C;inc5=inc5+1)
		begin
			if(buff[inc5]==16'h0000)
			begin
				if(f1!=16'hFFFF)
				begin
					ctrl[inc5]=InCtrl;
					f1=16'hFFFF;
				end
			end
		end*/
	end
	
end
endmodule
