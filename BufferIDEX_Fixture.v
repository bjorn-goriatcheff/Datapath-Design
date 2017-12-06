`include "BufferIDEX.v"

module BufferIDEX_Fixture;

wire [15:0] OD1;
wire [15:0] OD2;
wire [15:0] OD15;
wire [3:0] ORS;
wire [3:0] ORT1;
wire [3:0] ORT2;
wire [3:0] ORD;
wire [15:0] OC;
reg [15:0] ID1;
reg [15:0] ID2;
reg [15:0] ID15;
reg [3:0] IRS;
reg [3:0] IRT1;
reg [3:0] IRT2;
reg [3:0] IRD;
reg [15:0] IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," InData1 = %h, InData2 = %h, InData15 = %h, InRS = %h, InRT = %h, InRT2 = %h, InRD = %h, InCtrl = %h\n\t\t OutData1 = %h, OutData2 = %h, OutData15 = %h, OutCtrl = %h, OutRS = %h, OutRT = %h, OutRT2 = %h, OutRD = %h", ID1, ID2, ID15, IRS, IRT1, IRT2, IRD,IC, OD1, OD2, OD15, OC, ORS, ORT1, ORT2, ORD);

BufferIDEX a1(OD1,OD2,OD15,ORS,ORT1,ORT2,ORD,OC,ID1,ID2,ID15,IRS,IRT1,IRT2,IRD,IC,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive ctrl	
	#10;
	//receive data 15
	IC=12'hFFF;
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
	IRS=4'hE;
	#10;
	//receive RT1
	IRT1=4'h5;
	IC=12'h000;
	#10;
	//receive RT2
	IRT2=4'h3;
	IC[0]=1'b0;
	#10;
	//receive RD
	IRD=4'h2;
	#10;

end

initial
begin
  C = 1'b0;
  forever #5 C = ~C;
end

initial
begin
  #200 $finish;
end
endmodule
