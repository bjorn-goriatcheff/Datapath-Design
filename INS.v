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
		data[0]=16'b1111000100100000;
		//data[0]=16'hF120;
		//SUB R1 R2
		data[1]=16'b1111000100100001;
		// data[1] 16'hF121
		//ORi R3 FF
		data[2]=16'h93FF;
		//ANDi R3 4C
		data[3]=16'h834C;
		//MUL R5 R6
		data[4]=16'hF564;
		//DIV R1 R5
		data[5]=16'hF155;

	end
	else if(clk)
	begin
		case(in)
			8'h00: out = data[0];
			8'h02: out = data[1];
			8'h04: out = data[2];
			8'h06: out = data[3];
			8'h08: out = data[4];
			8'h0A: out = data[5];
		endcase	
	end	
end
endmodule
