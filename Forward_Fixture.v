`include "Forward.v"

module Forward_Fixture;

wire [1:0] HM;
wire [1:0] LM;
reg [3:0]RT;
reg [3:0]RS;
reg [3:0]EMRD;
reg [3:0]MWRD;

initial
  $vcdpluson;

initial
  $monitor($time," HM = %b, LM = %b, RT = %h, RS = %h, EMRD = %h, MWRD = %h", HM, LM, RT, RS, EMRD, MWRD);

Forward a1(HM,LM,RT,RS,EMRD,MWRD);

initial
begin
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
	RT=4'hF;	
	RS=4'hE;
	EMRD=4'hF;
	MWRD=4'hE;
	#10;
	//receive locations
	RT=4'hF;	
	RS=4'hE;
	EMRD=4'hE;
	MWRD=4'hF;
	#10;
	//receive locations
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
