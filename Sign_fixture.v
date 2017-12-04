`include "Sign.v"
module Sign_fixture;

reg [3:0] in;
wire [15:0] out;
initial
        $vcdpluson;
initial
        $monitor($time, " in = %b out = %b", in, out);

Sign s(out, in);

initial
begin
	in = 4'h0;
	#10 in = 8'h1;
	#20 in = 8'hF;
end

initial
begin
        #100 $finish;
end


endmodule
