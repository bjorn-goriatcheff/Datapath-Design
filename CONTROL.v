module CONTROL(
//	output reg[1:0]ALUsrc1,
//	output reg[1:0]ALUsrc2,
//	output reg SRC15,
	output reg OFFset,
	output reg Imm,
//	output reg Down,
//	output reg Mbyte,
	output reg MV1src,
	output reg Halt,
//	output reg[1:0] Branch,
	output reg[1:0] Wdst,
//	output reg[1:0] MemW,
	input [3:0] opcode,
	input [3:0] func
);

always@(*)
begin
//	ALUsrc1 = 2'b00;                
//	ALUsrc2 = 2'b00;                
//	SRC15 = 1'b0;                        
	OFFset = 1'b0;                        
	Imm = 1'b0;                        
//	Down = 1'b0;                 
	MV1src = 1'b1;
	Halt = 1'b0;
	Wdst = 2'b00;
	

	case(opcode)
		//TYPE A
		4'b1111: 			
			case(func)
				//MUL
				4'b0100:
					Wdst = 2'b10;
				//DIV
				4'b0101:
					Wdst = 2'b10;
				//MOVE
				4'b0111:
					MV1src = 1'b0;
				//SWAP
				4'b1000:
				begin
					MV1src = 1'b0;
					Wdst = 2'b01;
				end					
			endcase
		//TYPE C
		4'b1000:
		begin
			OFFset = 1'b1;
			Imm = 1'b1;
		end
		4'b1001:
			Imm = 1'b1;		

	endcase


end
endmodule




