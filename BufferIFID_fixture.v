`include "BufferIFID.v"

module BufferIFID_fixture;

//IFID
wire [15:0] OI;
wire OC;
reg [15:0]II;
reg IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," IFID InInstr B = %h, InCtrl = %h, OutInstr = %h, OutCtrl = %h ", II, IC, OI, OC);

BufferIFID a1(OI,OC,II,IC,C,R);

initial
begin
	R=0;
	#10;
	R=1;
	//IFID
	//receive instr
	II=16'hF230;
	#10;
	//receive ctrl
	II=16'hF400;
//	IC = 1'b1;
	#10;
	II=16'hF500;
	#10;
	II=16'hF600;
	#10;
	II=16'hF700;
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
