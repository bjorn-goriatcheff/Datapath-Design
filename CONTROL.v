module CONTROL(
//	output reg[1:0]ALUsrc1,
//	output reg[1:0]ALUsrc2,
//	output reg SRC15,
	output reg OFFset,
	output reg Imm,
	output reg Down,
	output reg Mbyte,
	output reg MV1src,
	output reg Halt,
	output reg Fdst,
	output reg[1:0] Bra,
	output reg[1:0] Wdst,
	output reg[1:0] MemW,
	output reg wb,
	output reg MEMflush,
	output reg IFflush,
	output reg[1:0] IDflush,
	output reg EXflush,
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
	Down = 1'b0;                 
	Mbyte = 1'b0;
	MV1src = 1'b1;
	Halt = 1'b0;
	Wdst = 2'b00;
	MemW = 2'b00;
	//TODO modif zith cases
	wb=1'b1;	
	Bra = 2'b11;
	// NO FLUSH == 1
	MEMflush=1'b1;
	IFflush = 1'b1;
	IDflush=2'b11;
	EXflush = 1'b1;
	//RT or RS
	Fdst=1'b0;
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
			Imm = 1'b1;
		end
		4'b1001:
			Imm = 1'b1;		
		//TYPE B
		//Load Byte
		4'b1010:
		begin
			OFFset = 1'b1;
			Mbyte = 1'b1;
			Down = 1'b1;
		end
		//Store Byte
		4'b1011:
		begin
			OFFset = 1'b1;
			MemW = 2'b01;
		end
		//Load Word
		4'b1100:
		begin
			OFFset = 1'b1;
			Down = 1'b1;
		end
		//Store Word
		4'b1101:
		begin
			OFFset = 1'b1;
			MemW = 2'b10; 
		end
		//TYPE C
		// BLT
		4'b0101: Bra = 2'b01;
		//BGT
		4'b0100: Bra = 2'b10;
		//BEQ
		4'b0110: Bra = 2'b00;
	endcase


end
endmodule




