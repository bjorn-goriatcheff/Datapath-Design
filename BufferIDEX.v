module BufferIDEX#(parameter S=15, C=15)
(
	output reg[S:0] OutData1,
	output reg[S:0] OutData2,
	output reg[S:0] OutData15,
	output reg[3:0] OutDataRS,
	output reg[3:0] OutDataRT1,
	output reg[3:0] OutDataRT2,
	output reg[3:0] OutDataRD,
	output reg[C:0] OutCtrl,
	input [S:0] InData1,
	input [S:0] InData2,
	input [S:0] InData15,
	input [3:0] InRS,
	input [3:0] InRT1,
	input [3:0] InRT2,
	input [3:0] InRD,
	input [C:0] InCtrl,
	input clk,
	input rst
);

reg[S:0] Data1;
reg[S:0] Data2;
reg[S:0] Data15;
reg[3:0] DataRS;
reg[3:0] DataRT1;
reg[3:0] DataRT2;
reg[3:0] DataRD;
reg[C:0] Ctrl;


//Combinatorial READ
always@(*)
begin
	OutData1=Data1;
	OutData2=Data2;
	OutData15=Data15;
	OutDataRS=DataRS;
	OutDataRT1=DataRT1;
	OutDataRT2=DataRT2;
	OutDataRD=DataRD;
	OutCtrl=Ctrl;
end
always@(posedge clk, negedge rst)
begin
	if(!rst)
        begin
                Data1<=15'h0000;
                Data2<=15'h0000;
                Data15<=15'h0000;
                DataRS<=4'h0;
                DataRT1<=4'h0;
                DataRT2<=4'h0;
                DataRD<=4'h0;
                Ctrl<=15'h0000;

        end

	if(InCtrl==15'h000)
	begin
		Data1<=15'h0000;
                Data2<=15'h0000;
                Data15<=15'h0000;
                DataRS<=4'h0;
                DataRT1<=4'h0;
                DataRT2<=4'h0;
                DataRD<=4'h0; 
		Ctrl<=15'h000;
	end
	else
	begin
		Data1<=InData1;
		Data2<=InData2;
		Data15<=InData15;
		DataRS<=InRS;
		DataRT1<=InRT1;
		DataRT2<=InRT2;
		DataRD<=InRD;
		Ctrl<=InCtrl;
	end
end

endmodule
