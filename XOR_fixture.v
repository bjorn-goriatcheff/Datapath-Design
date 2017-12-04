`include "XOR.v"

module XOR_fixture;

reg[1:0] in1, in2;
wire out;

initial
        $vcdpluson;
initial
        $monitor($time, " in1 = %b, in2 = %b , out = %b ", in1, in2, out);

XOR x(out, in1, in2);

initial
begin
	in1=2'b00;
	in2=2'b00;
	#5 in1=2'b01;
        in2=2'b00;
	#10 in1=2'b10;
        in2=2'b00;
	#15 in1=2'b11;
        in2=2'b00;
	#20 in1=2'b00;
        in2=2'b01;
	#25 in1=2'b01;
        in2=2'b01;
	#30 in1=2'b10;
        in2=2'b01;
        #40 in1=2'b11;
        in2=2'b01;
        #50 in1=2'b00;
        in2=2'b10;
        #60 in1=2'b01;
        in2=2'b10;
        #70 in1=2'b10;
        in2=2'b10;
        #80 in1=2'b11;
        in2=2'b10;
        #90 in1=2'b00;
        in2=2'b11;
        #100 in1=2'b01;
        in2=2'b11;
        #110 in1=2'b10;
        in2=2'b11;
        #120 in1=2'b11;
        in2=2'b11;
end
endmodule
