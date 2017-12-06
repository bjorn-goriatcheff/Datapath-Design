module BufferMEMWB#(parameter S=15, N=3)
(
	output reg[S:0] OutWord,
	output reg[7:0] OutByte,
	output reg[3:0] ForwardOut,
	output reg[3:0] WB,
	input [S:0] InWord,
	input [7:0] InByte,
	input [3:0]InCtrl,
	input [3:0] ForwardIn,
	input clk,
	input rst
);

reg[S:0] Word;
reg[7:0] Byte;
reg[3:0] Forw;
reg[3:0] BWB;
always@(*)
begin
	OutWord=Word;
	OutByte=Byte;
	ForwardOut=Forw;
	WB=BWB;
end
always@(*)
begin
	if(!rst)
        begin
                Word<=16'h0000;
                Byte<=8'h00;
                Forw<=4'h0;
		BWB<=4'h0;
        end
	if(!InCtrl)
	begin
		Word<=16'h0000;
        	Byte<=8'h00;
        	Forw<=4'h0;
		BWB<=4'h0;
	end
	else
	begin
		Word<=InWord;
		Byte<=InByte;
		Forw<=ForwardIn;
		BWB<=InCtrl;
	end
end
endmodule
