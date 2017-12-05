module Forward(
	output reg[1:0] HighMUX,
	output reg[1:0] LowMUX,
	input [3:0] RT,
	input [3:0] RS,
	input [3:0] EMRD, 
	input [3:0] MWRD
);

//Combinatorial READ
always@(*)
begin
	//if(WriteDST) how to check?
	if(EMRD==RS)
	begin	
		HighMUX=2'b10;
	end
	if(EMRD==RT)
	begin	
		LowMUX=2'b10;
	end
	if(MWRD==RS)
	begin	
		HighMUX=2'b01;
	end
	if(MWRD==RT)
	begin	
		LowMUX=2'b01;
	end
	if((EMRD!=RS)&&(EMRD!=RT)&&(MWRD!=RS)&&(MWRD!=RT))
	begin
		HighMUX=2'b00;
		LowMUX=2'b00;
	end
end
endmodule
