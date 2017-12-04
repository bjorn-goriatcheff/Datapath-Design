module INS#(parameter SIZE=64, NS=7)
	(output reg[15:0] out,
	input [NS:0] in,
	input clk, 
	input rst
	);
integer i;
reg[15:0] data [SIZE-1:0];

always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		//ADD R1 R2
		data[0]=16'b1111000100100000; //data[0]=16'hF120;
		//SUB R1 R2
		data[1]=16'b1111000100100001; // data[1] 16'hF121
		//ORi R3 FF
		data[2]=16'h93FF;
		//ANDi R3 4C
		data[3]=16'h834C;
		//MUL R5 R6
		data[4]=16'hF564;
		//DIV R1 R5
		data[5]=16'hF155;
		//SUB R15 R15
		data[6]=16'hFFF1;
		//MOV R4, R8
		data[7]=16'hF487;
		//SWP R4 R6
		data[8]=16'hF468;
		//ORI R4 2
		data[9]=16'h9402;
		//LBU R6 4(R9)
		data[10]=16'hA694;		
		//SB R6, 6(R9)
		data[11]=16'hB696;
		//LW R6 6(R9)
		data[12]=16'hC696;
		/////BEQ R7 4		//TODO
		data[13]=16'hC696;
		//ADD R11 R1
		data[14]=16'hFB10;
		//////BLT R7 5		//TODO
		data[15]=16'hFB10;
		//ADD R11 R2
		data[16]=16'hFB20;
		//BGT R7 2
		data[17]=16'hFB20;
		//ADD R1 R1
		data[18]=16'hF110;
		//ADD R1 R1
		data[19]=16'hF110;
		//LW R8 0(R9)
		data[20]=16'hC890;
		//ADD R8 R8
		data[21]=16'hF880;
		//SW R8 2(R9)
		data[22]=16'hD892;
		//LW R10 2(R9)
		data[23]=16'hCA92;
		//ADD R12 R12
		data[24]=16'hFCC0;
		//SUB R13 R13
		data[25]=16'hFDD1;
		//ADD R12 R13
		data[26]=16'hFCD0;
		//EFFF
		data[27]=16'hEFFF;



	end
	else if(clk)
		//case(in)
		//	8'h00: out = data[0];
		//	8'h02: out = data[1];
		//	8'h04: out = data[2];
		//	8'h06: out = data[3];
		//	8'h08: out = data[4];
		//	8'h0A: out = data[5];
		//endcase
		out = data[in/2];		
end
endmodule
