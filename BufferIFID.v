module BufferIFID#(parameter S=15)
(
	output reg[S:0] OutInstr,
	input [S:0] InInstr,
	//flush/hazard
	input clk,
	input rst
);
integer b;

always@(*)
begin
	OutInstr = InInstr;
end

/*Sequential WRITE
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin	
		OutInstr <= 16'h0000;
	end	
	//if(flush)
	else
	begin
		b <= InInstr;
	end
end
*/
endmodule
