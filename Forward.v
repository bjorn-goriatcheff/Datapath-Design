module Forward(
	output reg[1:0] HighMUX,
	output reg[1:0] LowMUX,
	input [3:0] RT,
	input [3:0] RS,
	input [3:0] EMRD, 
	input [3:0] MWRD,
	input [3:0]CTRLMEM,
	input [3:0]CTRLWB
);

//Combinatorial READ
always@(*)
begin
	
	HighMUX=2'b00;
	LowMUX=2'b00;
	if(CTRLMEM==4'h0)
	begin
		if(EMRD==RS)
		begin	
			HighMUX=2'b10;
		end
		if(EMRD==RT)
		begin	
			LowMUX=2'b10;
		end
	end
	if(CTRLWB==4'h0)
	begin
		if(MWRD==RS)
		begin	
			HighMUX=2'b01;
		end
		if(MWRD==RT)
		begin	
			LowMUX=2'b01;
		end
	end
end
endmodule
