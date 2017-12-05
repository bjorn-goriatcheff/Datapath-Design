`include "BufferIDEX.v"

module BufferIDEX_Fixture;

wire [15:0] OD1;
wire [15:0] OD2;
wire [15:0] OD15;
wire [15:0] ORS;
wire [15:0] ORT1;
wire [15:0] ORT2;
wire [15:0] ORD;
wire [3:0] OC;
reg [15:0] ID1;
reg [15:0] ID2;
reg [15:0] ID15;
reg [15:0] IRS;
reg [15:0] IRT1;
reg [15:0] IRT2;
reg [15:0] IRD;
reg [3:0] IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," InData1 = %h, InData2 = %h, InData15 = %h, InCtrl = %h, OutData1 = %h, OutData2 = %h, OutData15 = %h, OutCtrl = %h", ID1, ID2, ID15, IC, OD1, OD2, OD15, OC);

BufferIDEX a1(OD1,OD2,OD15,ORS,ORT1,ORT2,ORD,OC,ID1,ID2,ID15,IRS,IRT1,IRT2,IRD,IC,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive ctrl
	IC=4'h8;
	#10;
	//receive data 15
	ID15=16'hFFF0;
	#10;
	//receive data 1
	ID1=16'h0A01;
	#10;
	//receive data 2
	ID2=16'h00B3;
	#10;
	//receive D15
	ID15=16'h000F;
	#10;
	//receive RS
	IRS=16'hE00F;
	#10;
	//receive RT1
	IRT1=16'h0056;
	#10;
	//receive RT2
	IRT2=16'h030F;
	#10;
	//receive RD
	IRD=16'h200F;
	#10;

end

initial
begin
  C = 1'b0;
  forever #10 C = ~C;
end

initial
begin
  #100 $finish;
end
endmodule
