`include "PC.v"
`include "Adder2.v"
`include "MU3x1.v"
`include "INS.v"

module Count_fixture;

wire[15:0] inst;
wire[15:0] count, addr, n_add;
reg CLOCK, CLEAR, CTRL;

initial
        $vcdpluson;
initial
        $monitor($time, "PC = %b    add = %b   ctrl=%b     inst=%h", count, addr, CTRL, inst);
MU3x1 #(15)mux(n_add, count, addr, CTRL);
Adder2 up(addr, count);
PC pc(count, n_add, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
initial
begin
        CLEAR=1'b0;
	CTRL=1'b1;
        #20 CLEAR=1'b1;
	CTRL=1'b0;
	#50 CTRL=1'b1;
	#200 CTRL=1'b0;
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
