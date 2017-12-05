module SignBr(
	output reg[15:0] out,
	input [7:0] in
);
always@(*)
begin
	out[7:0]=in;
	if(out[7]==1'b1) out[15:8]=8'hFF;
	else if(out[7]==1'b0) out[15:8]=8'h00;
end

endmodule
