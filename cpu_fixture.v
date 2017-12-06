`include "cpu.v"
module cpu_fixture;

wire[15:0] inst_b, inst, data1, data2, data15, data1_b, data2_b, data15_b, low, up, low_b, up_b, z_ex, s_ex, src1, src2, src1_sel, src2_sel;
wire[15:0] w1, word, word_b, w15, mm, mmb, dw, w_word;
wire[15:0] count, addr, n_add, b_ex, b_ssl, n_br,n_pc; 
wire[7:0] byte, byte_b, w_byte;
wire [3:0] op, rt_b, rt2_b, rs_b, rd_b, f2_out,f3_out, f4_out;
wire[1:0] ze, cm;
reg CLOCK, CLEAR;
wire HALT, OFFSET, IMM, MV1, MBYTE, DOWN, BR, FORIN, IFFLUSH,EXFLUSH, DEST;
wire OFFSET_B, IMM_B, MV1_B, MBYTE_B, MBYTE_IN, DOWN_B, FDST_B;
reg HAL;
wire [1:0]WRITEDST, WRITEDST_B, MEMW, MEMW_B,MEMW_IN, BRANCH, IDCTRL, HMUX, LMUX;
wire [1:0]IDFLUSH;
wire[15:0]IN, OUT;
wire[3:0] WB_OUT, MEM_OUT,OP_B, WB, WBC;

initial
        $vcdpluson;
initial
$monitor($time, "  PROGRAM COUNTER:  PC = %h, New_PC = %h Branch = %h\n\t\t INSTRUCTION: %h, Read.op1 = %h, Read.op2 = %h\n\t\t ALU: Lower = %h, op1 = %h, op2 = %h, opcode = %b, func = %b,\n\t\t REGISTERS: WriteReg1 = %h, WriteReg2 = %h, WriteReg15 = %h, Wdst = %b \n\t\t MEMORY: Byte = %h, Word = %h\n\n\t\t INPUT IF/ID : INST = %h, IFFLUSH = %b OUTPUT INST = %h \n\t\tINPUT ID/EX_BUFFER : data1 = %h, data2 = %h, data15 = %h \n\t\t OUTPUT ID/EX : data1 = %h, data2 =%h, data15 = %h, func = %b\n\t\t INPUT EXMEM : Lower = %h, Upper = %h, Word %h, Byte = %h \n\t\t OUTPUT EXMEM: Lower = %h, Upper = %h, Word = %h, Byte = %h\n\t\t INPUT MEMWB: Word = %h, Byte = %h, OUTPUT: Word = %h, Byte = %h\n\t\t ID/EX.FOR = %h, EX/MEM.FOR = %h, MEM/WB.FOR = %h\n\t\t HMUX = %h, LMUX = %h\n", count, n_add, n_br, inst_b, inst[11:8], inst[7:4], low, src1, src2, OUT[15:12], op, w1, data1, w15,  WRITEDST, byte, word, inst_b, IFFLUSH, inst ,data1_b, data2_b, data15_b, data1, data2, data15, OUT[15:12], low_b, up_b, data1, data1[7:0], low, w15, w_word, w_byte, w_word, w_byte, word, byte, f2_out, f3_out, f4_out, HMUX, LMUX);
	 
 	  

MU3x1 #(15)mux(n_add, count, addr, HAL);
MU3x1 #(15)off(src1_sel, s_ex, data1, OUT[10]);
MU3x1 #(15)imm(src2_sel, z_ex, data2, OUT[11]);
MU3x1 #(15)mby(mm, mmb, word, WB[3]);
MU3x1 #(15)dwn(dw, mm, low, MEM_OUT[1]);
MU3x1 #(15)mv1(w1, dw, data2, OUT[9]);
MU3x1 #(15)bran(n_pc, n_br, n_add, BR);
MU3x1 #(3)forw(f2_out,rd_b, rt_b, FORIN); 
MU4x1 sel(src1,src1_sel,w15,dw, HMUX);
MU4x1 sel2(src2,src2_sel, w15, dw, LMUX);

CMP cmp(cm,data1, data15);
XOR x(BR, cm, BRANCH);

BufferIFID buf_ifid(inst, inst_b, IFFLUSH, CLOCK, CLEAR);
BufferIDEX buf_idex(data1, data2, data15, rs_b, rt_b, rt2_b, rd_b, OUT, data1_b, data2_b, data15_b, inst[11:8], inst[7:4], inst[3:0], inst[3:0], IN, CLOCK, CLEAR);
BufferEXMEM buf_exmem(w15, low, w_word, w_byte, f3_out, WB_OUT, MEM_OUT, up_b, low_b, data1, data1[7:0], f2_out, OUT[3:0], OUT[7:4], CLOCK, CLEAR);
BufferMEMWB buf_memwb(word, byte, f4_out, WB, word_b, byte_b, WB_OUT, f3_out, CLOCK, CLEAR);

Gather g(IN, WB_B, WRITEDST_B, MBYTE_B, MEM_B, DOWN_B, MEMW_B, FDST_B, MV1_B, OFFSET_B, IMM_B, OP_B);
Forward frw(HMUX, LMUX, rt_b, rs_b, f3_out, f4_out, WB_OUT,WB ); 

Zero z(z_ex, inst[7:0]);
Zero m_z(mmb, byte);
Sign s(s_ex, inst[3:0]);
SignBr br_s(b_ex, inst[7:0]);
SSL br_ssl(b_ssl, b_ex);
Adder2 ad(addr, count);
AdderBr br(n_br,count,b_ssl);


PC pc(count, n_pc, CLOCK, CLEAR);
INS ins(inst_b, count, CLOCK, CLEAR);
Registers re(data1_b, data2_b, data15_b, inst[11:8], inst[7:4], w1, data1, w15, WB[2:1], CLOCK, CLEAR);
ALU a(up_b, low_b, ze, src1, src2, OUT[15:12]);
ALU_CONTROL ctrl_a(OP_B, inst[15:12], inst[3:0]);
CONTROL ctrl(OFFSET_B, IMM_B, DOWN_B ,MBYTE_B, MV1_B, HALT, FDST_B, BRANCH, WRITEDST, MEMW_B,MEM_B, WB_B, IFFLUSH, IDFLUSH, EXFLUSH,  inst[15:12], inst[3:0]);
Memory mem(byte_b, word_b, low, w_word, w_byte, MEM_OUT[3:2], CLOCK, CLEAR);

initial
begin
        CLEAR=1'b0; 
	HAL=1'b1;
	#5 CLEAR=1'b1; 
	HAL=1'b0;
end
initial
begin
        CLOCK=1'b0;
        forever #5 CLOCK=~CLOCK;
end


initial
begin
        #300 $finish;

end

endmodule 
