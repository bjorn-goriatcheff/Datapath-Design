module BufferEXMEM#(parameter S=15, N=4, C=1)
(
	output reg[S:0] OutUpper,
	output reg[S:0] OutLower,
	output reg[S:0] OutWord,
	output reg[7:0] OutByte,
	output reg[3:0] Forward,
	output reg[3:0] OutCtrlW,
	output reg[3:0] OutCtrlM,
	//forward out
	input [S:0] InUpper,
	input [S:0] InLower,
	input [S:0] InWord,
	input [7:0] InByte,
	input [3:0] For,
	//forward in
	input [3:0]InCtrlW,
	input [3:0]InCtrlM, 
	input clk,
	input rst
);

reg[S:0] Upper;
reg[S:0] Lower;
reg[S:0] Word;
reg[7:0] Byte;
reg[3:0] Forw;
reg [3:0]CtrlM;
reg [3:0]CtrlW;



//Combinatorial READ
always@(*)
begin

	OutUpper=Upper;
	OutLower=Lower;
	OutWord=Word;
	OutByte=Byte;
	OutCtrlW=CtrlW;
	OutCtrlM=CtrlM;
	Forward=Forw;

end
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		Upper<=16'h0000;
                Lower<=16'h0000;
                Word<=16'h0000;
                Byte<=8'h00;
                CtrlM<=4'h0;
		CtrlW<=4'h0;
		Forw<=4'h0;
	end
	if(InCtrlM==4'h0)
        begin
                Upper<=16'h0000;
                Lower<=16'h0000;
                Word<=16'h0000;
                Byte<=8'h00;
                CtrlW<=4'h0;
		CtrlM<=4'h0;
	end             
	else
	begin
		Upper<=InUpper;
		Lower<=InLower;
		Word<=InWord;
		Byte<=InByte;
		CtrlM<=InCtrlM;
		CtrlW<=InCtrlW;
		Forw<=For;
	end
end
endmodule
