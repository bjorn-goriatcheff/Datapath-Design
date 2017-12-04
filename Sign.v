module Sign(
	output reg[15:0] out,
	input [3:0] in
);
always@(*)
begin
	out[3:0]=in;
	if(out[3]==1'b1) out[15:4]=12'hFFF;
	else if(out[3]==1'b0) out[15:4]=12'h000;
end

endmodule
