`include "PC.v"
`include "Adder2.v"
`include "INS.v"
`include "Registers.v"
`include "ALU.v"
`include "Sign.v"
`include "Zero.v"
`include "MU3x1.v"
`include "ALU_CONTROL.v"
`include "CONTROL.v"


module EX_fixture;

wire[15:0] inst, data1, data2, data15, low, up, z_ex, s_ex, src1, src2;
wire[15:0] w1, w2, w15;
wire[7:0] count, addr, n_add;
wire [3:0] op;
wire[1:0] ze;
reg CLOCK, CLEAR;
wire HALT, OFFSET, IMM, MV1;
reg HAL;
wire [1:0]WRITEDST;


initial
        $vcdpluson;
initial
        $monitor($time, " Upper = %h,  Lower = %h, op1 = %h, op2 = %h, opcode = %b, func = %b,\n\t  WriteReg1 = %h, WriteReg2 = %h, WriteReg15 = %h, Wdst = %b", w15, low, src1, src2, inst[15:12], op, w1, data1, w15,  WRITEDST);
	 
 	  

MU3x1 #(7)mux(n_add, count, addr, HAL);
MU3x1 #(15)off(src1, s_ex, data1, OFFSET);
MU3x1 #(15)imm(src2, z_ex, data2, IMM);
MU3x1 #(15)mv1(w1, low, data2, MV1);
Zero z(z_ex, inst[7:0]);
Sign s(s_ex, inst[7:0]);
Adder2 ad(addr, count);
PC pc(count, n_add, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
Registers re(data1, data2, data15, inst[11:8], inst[7:4], w1, data1, w15, WRITEDST, CLOCK, CLEAR);
ALU a(w15, low, ze, src1, src2, op);
ALU_CONTROL ctrl_a(op, inst[15:12], inst[3:0]);
CONTROL ctrl(OFFSET, IMM, MV1, HALT, WRITEDST, inst[15:12], inst[3:0]);

initial
begin
        CLEAR=1'b0;
        HAL=1'b1;
	#10 CLEAR=1'b1; 
	#10 HAL = 1'b0;

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
