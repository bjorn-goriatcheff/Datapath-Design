module XOR#(parameter N=1)
(
	output reg res,
	input [N:0] op1,
	input [N:0] op2
);
always@(*)
begin
	case(op1^op2)
		2'b00: res = 1'b1;
		default: res = 1'b0;
	endcase


end
endmodule
