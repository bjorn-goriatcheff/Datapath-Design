module Zero(
	output reg[15:0] out,
	input [7:0] in
);
always@(*)

begin
	out[7:0]=in;
	out[15:8]=12'h00;
end
endmodule
