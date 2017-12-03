`include "Registers.v"
module Registers_fixture;

reg [3:0] add1, add2;
reg [1:0] dst;
wire [15:0] dat1, dat2, dat15, w1, w2, w15;
reg CLOCK, CLEAR;
initial
        $vcdpluson;
initial
        $monitor($time, "data1 = %h, data2 = %h, data15 = %h ", dat1, dat2, dat15);

Registers re(dat1, dat2, dat15, add1, add2, w1, w2, w15, dst, CLOCK, CLEAR);

initial
begin
	CLEAR=2'b0;
	dst=2'b11;
	#10 CLEAR=1'b1; 
	add1 = 4'h1;
	add2 = 4'h2;
	#30 add1 = 4'h3;
	add2 = 4'h4;
end

initial
begin
        CLOCK=1'b0;
        forever #5 CLOCK=~CLOCK;
end
initial
begin
        #400 $finish;
end



endmodule

