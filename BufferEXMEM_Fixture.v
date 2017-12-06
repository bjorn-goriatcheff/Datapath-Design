`include "BufferEXMEM.v"

module BufferEXMEM_Fixture;

wire [15:0] OU;
wire [15:0] OL;
wire [15:0] OW;
wire [7:0] OB;
wire [3:0] FOR;
wire [3:0]OCW;
wire [3:0]OCM;
//
reg [15:0]IU;
reg [15:0]IL;
reg [15:0]IW;
reg [3:0] IFOR;
reg [7:0]IB;
reg [3:0]ICW;
reg [3:0]ICM;
//
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," IU %h IL %h IW %h IB %h ICW %h ICM %h IFOR %h OU %h OL %h OW %h FOR %h OB %h OCW %h OCM %h", IU, IL, IW, IB, ICW, ICM, IFOR, OU, OL, OW, FOR, OB, OCW, OCM);

BufferEXMEM a1(OU, OL, OW, OB,FOR, OCW, OCM, IU, IL, IW, IB, IFOR, ICW, ICM,C, R);

initial
begin
	R=0;
	#10;
	R=1;
	ICW=4'h1;
	ICM=4'h1;
	//receive instr
	IU=16'hF230;
	#10;
	//receive instr
	IL=16'hF400;
	IFOR=4'h5;
	#10;
	//receive instr
	IW=16'hF500;
	#10;
	//receive instr
	IB=8'hF6;
	IFOR=4'hF;
	#10;
	//receive instr
	ICM=4'h0;
        IB=8'hF6;	
	#10;
	IL=16'hF400;
	IW=16'hF500;
	#10;
	ICM=4'h1;
	IL=16'hF400;
	#10;
	
end

initial
begin
  C = 1'b0;
  forever #5 C = ~C;
end

initial
begin
  #100 $finish;
end
endmodule
