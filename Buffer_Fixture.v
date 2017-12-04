`include "BufferIFID.v"
`include "BufferIDEX.v"
`include "BufferEXMEM.v"
`include "BufferMEMWB.v"

module Buffer_Fixture;

//IFID
wire [15:0] OI;
wire [15:0] OC;
reg [15:0]II;
reg [15:0]IC;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," IFID InInstr B = %h, InCtrl = %h, OutInstr = %h, OutCtrl = %h", II, IC, OI, OC);

BufferIFID a1(OI,OC,II,IC,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//IFID
	//receive instr
	II=16'h0001;
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
