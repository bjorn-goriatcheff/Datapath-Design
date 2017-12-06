`include "ALU.v"

module ALU_fixture;

reg [15:0] dat1,dat2;
reg [3:0] op;
wire [15:0] up, low;
wire [1:0]ze;

initial
        $vcdpluson;
initial
        $monitor($time, "Data1 = %h, Data2 = %h, Upper = %b, Lower = %b, Zero = %b",dat1,dat2, up, low, ze);

ALU a(up, low, ze, dat1, dat2, op);

initial
begin

	dat1=16'h0000;
	dat2=16'h0000;
	op=4'h0;
	// ADD 0F,01 = 10
	#5 dat1 = 16'h000F;
	dat2 = 16'h0001;
	op = 4'h0;
	//SUB 100, 0F = 910
	#10 dat1 = 16'h0A00;
	dat2 = 16'h00F0;
	op = 4'h1;
	#20 dat1 = 16'h00FF;
	dat2 = 16'hF0F0;
	op = 4'b1001;
	#40 dat1 = 16'hxxx;
	dat2 = 16'hxxx;
	op = 4'hx;

end
initial
begin

	#400 $finish;
end
endmodule
