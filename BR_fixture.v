`include "PC.v"
`include "Adder2.v"
`include "INS.v"
`include "Registers.v"
`include "ALU.v"
`include "Sign.v"
`include "SignBr.v"
`include "Zero.v"
`include "MU3x1.v"
`include "ALU_CONTROL.v"
`include "CONTROL.v"
`include "Memory.v"
`include "AdderBr.v"
`include "SSL.v"
`include "XOR.v"
`include "CMP.v"


module BR_fixture;

wire[15:0] inst, data1, data2, data15, low, up, z_ex, s_ex, src1, src2;
wire[15:0] w1, word, w15, mm, mmb, dw;
wire[15:0] count, addr, n_add, b_ex, b_ssl, n_br,n_pc; 
wire[7:0] byte;
wire [3:0] op;
wire[1:0] ze, cm;
reg CLOCK, CLEAR;
wire HALT, OFFSET, IMM, MV1, MBYTE, DOWN, BR;
reg HAL;
wire [1:0]WRITEDST, MEMW, BRANCH;


initial
        $vcdpluson;
initial
        $monitor($time, "  PC = %h, New_PC = %h Branch = %h\n\t\t Read1 = %h, Read2 = %h, Data1 = %h, Data2 = %h, Data15 = %h\n\t\t Lower = %h, op1 = %h, op2 = %h, opcode = %b, func = %b,\n\t\t WriteReg1 = %h, WriteReg2 = %h, WriteReg15 = %h, Wdst = %b \n\t\t Byte = %h, Word = %h\n", count, n_add, n_br, inst[11:8], inst[7:4], data1, data2, data15, low, src1, src2, inst[15:12], op, w1, data1, w15,  WRITEDST, byte, word);
	 
 	  

MU3x1 #(15)mux(n_add, count, addr, HAL);
MU3x1 #(15)off(src1, s_ex, data1, OFFSET);
MU3x1 #(15)imm(src2, z_ex, data2, IMM);
MU3x1 #(15)mby(mm, mmb, word, MBYTE);
MU3x1 #(15)dwn(dw, mm, low, DOWN);
MU3x1 #(15)mv1(w1, dw, data2, MV1);
MU3x1 #(15)bran(n_pc, n_br, n_add, BR);

CMP cmp(cm,data1, data15);
XOR x(BR, cm, BRANCH);


Zero z(z_ex, inst[7:0]);
Zero m_z(mmb, byte);
Sign s(s_ex, inst[3:0]);
SignBr br_s(b_ex, inst[7:0]);
SSL br_ssl(b_ssl, b_ex);
Adder2 ad(addr, count);
AdderBr br(n_br,count,b_ssl);


PC pc(count, n_pc, CLOCK, CLEAR);
INS ins(inst, count, CLOCK, CLEAR);
Registers re(data1, data2, data15, inst[11:8], inst[7:4], w1, data1, w15, WRITEDST, CLOCK, CLEAR);
ALU a(w15, low, ze, src1, src2, op);
ALU_CONTROL ctrl_a(op, inst[15:12], inst[3:0]);
CONTROL ctrl(OFFSET, IMM, DOWN ,MBYTE, MV1, HALT, BRANCH, WRITEDST, MEMW, inst[15:12], inst[3:0]);
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
