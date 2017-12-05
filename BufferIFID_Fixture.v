`include "BufferIFID.v"

module BufferIFID_Fixture;

wire [15:0] OI;
reg [15:0]II;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," InInstr = %h, OutInstr = %h", II, OI);

BufferIFID a1(OI,II,C,R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive instr
	II=16'hF230;
	#10;
	//receive instr
	II=16'hF400;
	#10;
	//receive instr
	II=16'hF500;
	#10;
	//receive instr
	II=16'hF600;
	#10;
	//receive instr
	II=16'hF700;
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
