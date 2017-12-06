`include "Forward.v"

module Forward_Fixture;

wire [1:0] HM;
wire [1:0] LM;
reg [3:0]RT;
reg [3:0]RS;
reg [3:0]EMRD;
reg [3:0]MWRD;
reg [3:0]CTRL1;
reg [3:0]CTRL2;


initial
  $vcdpluson;

initial
  $monitor($time," HM = %b, LM = %b, RT = %h, RS = %h, EMRD = %h, MWRD = %h, CTRL1 = %h, CTRL2 = %h", HM, LM, RT, RS, EMRD, MWRD, CTRL1, CTRL2);

Forward a1(HM,LM,RT,RS,EMRD,MWRD,CTRL1, CTRL2);

initial
begin
	CTRL1=4'h0;
	//receive locations
	RT=4'hA;	
	RS=4'hB;
	EMRD=4'hC;
	MWRD=4'hD;
	#10;
	//receive locations
	RT=4'h8;	
	RS=4'h9;
	EMRD=4'h3;
	MWRD=4'h8;
	#10;
	//receive locations
	CTRL2=4'h1;
	RT=4'hF;	
	RS=4'hE;
	EMRD=4'hF;
	MWRD=4'hE;
	#10;
	//receive locations
	CTRL1=4'h2;
	RT=4'hF;	
	RS=4'hE;
	EMRD=4'hE;
	MWRD=4'hF;
	#10;
	//receive locations
	CTRL2=4'h5;
	RT=4'hA;	
	RS=4'hB;
	EMRD=4'hC;
	MWRD=4'hD;
	#10;
end

initial
begin
  #100 $finish;
end
endmodule
