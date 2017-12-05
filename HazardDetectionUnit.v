module HazardDetectionUnit(
	output reg PCWrite,
	output reg DWrite,
	output reg StallIE,
	input MemRead,
	input [7:0] IERT, 
	input [7:0] IIRT, 
	input [7:0] IIRS 
);

//Combinatorial READ
always@(*)
begin
	if(MemRead && ((IERT==IIRS) || (IERT==IIRT)))
	begin
		PCWrite=1'b1;
		DWrite=1'b1;
		StallIE=1'b1;
	end
	else
	begin
		PCWrite=1'b0;
		DWrite=1'b0;
		StallIE=1'b0;
	end
end
endmodule
