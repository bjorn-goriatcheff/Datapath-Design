module Control(
	output reg Halt,
	output reg[1:0] Branch,
	output reg Writedst,
	output reg SRC15,
	output reg[1:0] ALUsrc1,
	output reg OFFset,
	output reg[1:0] ALUsrc2,
	output reg Imm,
	output reg MV1src,
	output reg Down,
	output reg MemW,
	output reg Mbyte,
	input [3:0] OpCode,
	input clk,
	input rst
);

//Combinatorial READ
always@(*)
begin
	if(OpCode == 1111) //Type A
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=0
		MV1src=1 //?
		Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 1000) //ANDi
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=1
		ALUsrc2=2'b00
		Imm=1
		MV1src=1 
		Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 1001) //ORi
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=1
		MV1src=1
		Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 1010) //Load byte
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=1
		ALUsrc2=2'b00
		Imm=0
		MV1src=1
		Down=1
		MemW= 
		Mbyte=1
	end
	else if(OpCode == 1011) //Store byte
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=0
		MV1src=1
		Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 1100) //Load
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=1
		ALUsrc2=2'b00
		Imm=0
		MV1src=1
		Down=1
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 1101) //Store
	begin
		Halt=0
		Branch=2'b01
		Writedst=
		SRC15=0
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=0
		MV1src=1
		Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 0101) //Branch less than
	begin
		Halt=0
		Branch=2'b00
		Writedst=
		SRC15=1
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=0
		MV1src=1 
		//Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 0100) //Branch greater than
	begin
		Halt=0
		Branch=2'b00
		Writedst=
		SRC15=1
		ALUsrc1=2'b00
		OFFset=0
		ALUsrc2=2'b00
		Imm=0
		MV1src=1 
		//Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 0110) //Branch equal
	begin
		Halt=0
		Branch=2'b00
		Writedst=
		SRC15=1
		ALUsrc1=2'b00
		OFFset=1
		ALUsrc2=2'b00
		Imm=0
		MV1src=1 
		//Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 0001) //Jump
	begin
		Halt=0
		Branch=2'b00
		Writedst=
		SRC15=0
		//ALUsrc1=2'b00
		OFFset=1
		//ALUsrc2=2'b00
		//Imm=0
		MV1src=1 
		//Down=0
		MemW= 
		Mbyte=0
	end
	else if(OpCode == 0000) //Halt
	begin
		Halt=1
		Branch=2'b01
		Writedst=
		SRC15=0
		//ALUsrc1=2'b00
		//OFFset=0
		//ALUsrc2=2'b00
		//Imm=0
		MV1src=1 
		//Down=0
		MemW= 
		Mbyte=0
	end
end
endmodule