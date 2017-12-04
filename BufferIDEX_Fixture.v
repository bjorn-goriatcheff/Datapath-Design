`include "BufferIDEX.v"

module BufferIDEX_Fixture;

wire [15:0] OD1;
wire [15:0] OD2;
wire [15:0] OD15;
wire [15:0] OC;
reg [15:0] ID1;
reg [15:0] ID2;
reg [15:0] ID15;
reg [15:0] IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," InData1 = %h, InCtrl = %h, OutData1 = %h, OutCtrl = %h", ID1, IC, OD1, OC);

BufferIDEX a1(OD1,OD2,OD15,OC,ID1,ID2,ID15,IC,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive data 1
	ID1=16'h0001;
	#10;
	//receive ctrl
	IC=16'h0001;
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
