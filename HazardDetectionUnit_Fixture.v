`include "HazardDetectionUnit.v"

module HazardDetectionUnit_Fixture;

wire PCW;
wire DW;
wire SIE;
reg  MR;
reg [7:0] IERT;
reg [7:0] IIRT;
reg [7:0] IIRS;

initial
  $vcdpluson;

initial
  $monitor($time," IERT = %h IIRT = %h IIRS = %h PCW = %h DW = %h SIE = %h MR = %h", IERT, IIRT, IIRS, PCW, DW, SIE, MR);

HazardDetectionUnit a1(PCW,DW,SIE,MR,IERT,IIRT,IIRS);

initial
begin
	//receive bad signal
	MR=1'b1;
	IERT=8'h0F;
	IIRS=8'h0F;
	#10;
	//receive good signal
	MR=1'b0;
	IERT=8'h0C;
	IIRS=8'h0C;
	#10;
	//receive bad signal
	MR=1'b1;
	IERT=8'h03;
	IIRT=8'h03;
	#10;
	//receive good signal
	MR=1'b0;
	IERT=8'h1C;
	IIRS=8'h09;
	#10;
	//receive good signal
	MR=1'b1;
	#10;
end

initial
begin
  #100 $finish;
end
endmodule
