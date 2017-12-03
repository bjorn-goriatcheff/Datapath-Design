`include "Zero.v"
module Sign_fixture;

reg [7:0] in;
wire [15:0] out;
initial
        $vcdpluson;
initial
        $monitor($time, " in = %b out = %b", in, out);

Zero s(out, in);

initial
begin
	in = 8'h00;
	#10 in = 8'h01;
	#20 in = 8'hFF;
end

initial
begin
        #100 $finish;
end


endmodule
