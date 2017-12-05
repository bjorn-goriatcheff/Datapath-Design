`include "BufferEXMEM.v"

module BufferEXMEM_Fixture;

wire [15:0] OU;
wire [15:0] OL;
wire [15:0] OW;
wire [7:0] OB;
wire [1:0] OC;
//
reg [15:0]IU;
reg [15:0]IL;
reg [15:0]IW;
reg [7:0]IB;
reg [1:0]IC;
//
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," IU %h IL %h IW %h IB %h OU %h OL %h OW %h OB %h OC %h", IU, IL, IW, IB, OU, OL, OW, OB, OC);

BufferEXMEM a1(OU, OL, OW, OB, OC, IU, IL, IW, IB, IC, C, R);

initial
begin
	R=0;
	#10;
	R=1;

	//receive instr
	IU=16'hF230;
	#10;
	//receive instr
	IL=16'hF400;
	#10;
	//receive instr
	IW=16'hF500;
	#10;
	//receive instr
	IB=8'hF6;
	#10;
	//receive instr
	IC=2'b10;
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
