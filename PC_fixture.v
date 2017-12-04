`include "PC.v"

module PC_fixture;

reg CLOCK, CLEAR;
reg [15:0]add;
wire [15:0]counter;

initial
	$vcdpluson;
initial
	$monitor($time, "PC = %b    add = %b ", counter, add);

PC pc(counter, add, CLOCK, CLEAR);
initial
begin
	CLEAR=1'b0;
	#30 CLEAR=1'b1;
	add=16'h0002;
	#50 add=16'h0004;
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

