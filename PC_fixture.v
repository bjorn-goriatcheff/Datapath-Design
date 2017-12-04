`include "PC.v"

module PC_fixture;

reg CLOCK, CLEAR;
reg [7:0]add;
wire [7:0]counter;

initial
	$vcdpluson;
initial
	$monitor($time, "PC = %b    add = %b ", counter, add);

PC pc(counter, add, CLOCK, CLEAR);
initial
begin
	CLEAR=1'b0;
	#30 CLEAR=1'b1;
	add=8'h02;
	#50 add=8'h04;
end
initial
begin
	CLOCK=1'b0;
	forever #5 CLOCK=~CLOCK;
end
initial
begin 
	#100 $finish;
end
endmodule

