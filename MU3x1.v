module MU3x1#(parameter SIZE=15)
(
	output reg[SIZE:0] out,
	input [SIZE:0] a,
	input [SIZE:0] b,
	input ctrl

);
always@(*)
begin
	if(ctrl)
		out=a;
	else
		out=b;
end		
endmodule
