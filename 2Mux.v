module 2Mux(
	output reg[3:0] OutSignal,
	input [3:0] InSignal1,
	input [3:0] InSignal2,
	input signal
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	if(signal == 0)
		OutSignal = InSignal1;
	else
		OutSignal = InSignal2;
end
endmodule