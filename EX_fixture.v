`include "PC.v"
`include "Adder2.v"
`include "INS.v"
`include "Registers.v"
`include "ALU.v"
`include "MU3x1.v"
`include "ALU_CONTROL.v"
`include "CONTROL.v"

module EX_fixture;

wire[15:0] inst, data1, data2, data15, low, up;
wire[15:0] w1, w2, w15;
wire[7:0] count, addr, n_add;
wire [3:0] op;
wire[1:0] ze;
reg CLOCK, CLEAR;
wire HALT, OFFSET, IMM, MV1;
wire [1:0]WRITEDST;


initial
        $vcdpluson;
initial
        $monitor($time, " Upper = %h,  Lower = %h, op1 = %h, op2 = %h, opcode = %b, func = %b", up, low, data1, data2, inst[15:12], op);

MU3x1 #(7)mux(n_add, count, addr, HALT);
Adder2 ad(addr, count);
PC pc(count, n_add, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
Registers re(data1, data2, data15, inst[11:8], inst[7:4], w1, w2, w15, WRITEDST, CLOCK, CLEAR);
ALU a(up, low, ze, data1, data2, op);
ALU_CONTROL ctrl_a(op, inst[15:12], inst[3:0]);
CONTROL ctrl(OFFSET, IMM, MV1, HALT, WRITEDST, inst[15:12], inst[3:0]);

initial
begin
        CLEAR=1'b0;
        #5 CLEAR=1'b1; 

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
