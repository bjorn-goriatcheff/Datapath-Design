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
`include "Memory.v"

module EX_fixture;

wire[15:0] inst, data1, data2, data15, low, up, z_ex, s_ex, src1, src2;
wire[15:0] w1, word, w15, mm, mmb, dw;
wire[15:0] count, addr, n_add; 
wire[7:0] byte;
wire [3:0] op;
wire[1:0] ze;
reg CLOCK, CLEAR;
wire HALT, OFFSET, IMM, MV1, MBYTE, DOWN;
reg HAL;
wire [1:0]WRITEDST, MEMW;


initial
        $vcdpluson;
initial
        $monitor($time, "  PC = %h, New_PC = %h\n\t\t Read1 = %h, Read2 = %h, Data1 = %h, Data2 = %h,\n\t\t Lower = %h, op1 = %h, op2 = %h, opcode = %b, func = %b,\n\t\t WriteReg1 = %h, WriteReg2 = %h, WriteReg15 = %h, Wdst = %b \n\t\t Byte = %h, Word = %h\n", count, n_add, inst[11:8], inst[7:4], data1, data2, low, src1, src2, inst[15:12], op, w1, data1, w15,  WRITEDST, byte, word);
	 
 	  

MU3x1 #(15)mux(n_add, count, addr, HAL);
MU3x1 #(15)off(src1, s_ex, data1, OFFSET);
MU3x1 #(15)imm(src2, z_ex, data2, IMM);
MU3x1 #(15)mby(mm, mmb, word, MBYTE);
MU3x1 #(15)dwn(dw, mm, low, DOWN);
MU3x1 #(15)mv1(w1, dw, data2, MV1);
Zero z(z_ex, inst[7:0]);
Zero m_z(mmb, byte);
Sign s(s_ex, inst[3:0]);
Adder2 ad(addr, count);
PC pc(count, n_add, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
Registers re(data1, data2, data15, inst[11:8], inst[7:4], w1, data1, w15, WRITEDST, CLOCK, CLEAR);
ALU a(w15, low, ze, src1, src2, op);
ALU_CONTROL ctrl_a(op, inst[15:12], inst[3:0]);
CONTROL ctrl(OFFSET, IMM, DOWN ,MBYTE, MV1, HALT, WRITEDST, MEMW, inst[15:12], inst[3:0]);
Memory mem(byte, word, low, data1, data1[7:0], MEMW, CLOCK, CLEAR);

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
