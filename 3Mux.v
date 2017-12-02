module 3Mux(
	output reg[3:0] OutSignal,
	input [3:0] InSignal1,
	input [3:0] InSignal2,
	input [3:0] InSignal3,
	input [1:0] signal
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	if(signal == 00)
		OutSignal = InSignal1;
	else if(signal == 01)
		OutSignal = InSignal2;
	else if(signal == 10)
		OutSignal = InSignal3;
end
endmodule