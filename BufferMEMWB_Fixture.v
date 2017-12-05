`include "BufferMEMWB.v"

module BufferMEMWB_Fixture;

wire [15:0] OW;
wire [7:0] OB;
wire [15:0] OF;
reg [15:0]IW;
reg [7:0]IB;
reg [15:0]IF;
reg IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," InW = %h, InB = %h, InF = %h, OutW = %h, OutB = %h, OutF = %h,", IW, IB, IF, OW, OB, OF);

BufferMEMWB a1(OW,OB,OF,IW,IB,IC,IF,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive word
	IW=16'hA237;
	#10;
	//receive byte
	IB=8'hF0;
	#10;
	//receive forward
	IF=16'hF500;
	#10;
	//receive ctrl
	IC=1'b1;
	#10;
	//receive word
	IW=16'h8400;
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
