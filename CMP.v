module CMP#(parameter N=15)
(
	output reg[1:0] res,
	input [N:0] op1,
	input [N:0] op2
);
always@(*)
begin
	if(op1 < op2)
		res = 2'b01;
	else if(op1 > op2)
		res = 2'b10;
	else if(op1 == op2)
		res = 2'b00;

end
endmodule
