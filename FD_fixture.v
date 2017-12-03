`include "PC.v"
`include "Adder2.v"
`include "MU3x1.v"
`include "INS.v"
`include "Registers.v"

module Count_fixture;


wire[15:0] inst, data1, data2, data15;
wire[15:0] w1, w2, w15;
wire[7:0] count, addr, n_add;
reg CLOCK, CLEAR, HALT;
reg [1:0]WRITEDST;

initial
        $vcdpluson;
initial
        $monitor($time, "PC = %b  halt=%b  inst=%h inst[11:8]=%h inst[7:4]=%h \n data1 = %h, data2 = %h, data15 = %h", count, HALT, inst, inst[11:8], inst[7:4] , data1, data2, data15);
MU3x1 #(7)mux(n_add, count, addr, HALT);
Adder2 up(addr, count);
PC pc(count, n_add, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
Registers re(data1, data2, data15, inst[11:8], inst[7:4], w1, w2, w15, WRITEDST, CLOCK, CLEAR);
initial
begin
        CLEAR=1'b0;
        HALT=1'b1;
	WRITEDST=2'b11;
        #5 CLEAR=1'b1; 
        #10 HALT=1'b0; 
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

