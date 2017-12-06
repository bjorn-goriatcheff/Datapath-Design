
module MU4x1#(parameter SIZE=15)
(
	output reg[SIZE:0] out,
	input [SIZE:0] a,
	input [SIZE:0] b,
	input [SIZE:0] c,
	input[1:0] ctrl

);
always@(*)
begin
	if(ctrl==2'b00)
		out=a;
	else if(ctrl==2'b01)
		out=b;
	else if(ctrl==2'b10)
		out=c;
end		
endmodule
