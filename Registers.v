module Registers(
	output reg[15:0] Data1,
	output reg[15:0] Data2,
	output reg[15:0] Data15,
	input [3:0] ReadAdd1,
	input [3:0] ReadAdd2,
	input [3:0] WriteReg1,
	input [3:0] WriteReg2,
	input [3:0] WriteReg15,
	input WriteDst,
	input clk,
	input rst
);
//15 Registers
reg[15:0]Reg [15:0];
integer count;
//Combinatorial READ
always@(*)
begin
	//Read Register from Address 1
	count=0;
	count=count+ReadAdd1[0];
	count=count+ReadAdd1[1]*(2**1);
	count=count+ReadAdd1[2]*(2**2);
	count=count+ReadAdd1[3]*(2**3);
	Data1=Reg[count];
	//Read Register from Address 2
	count=0;
	count=count+ReadAdd2[0];
	count=count+ReadAdd2[1]*(2**1);
	count=count+ReadAdd2[2]*(2**2);
	count=count+ReadAdd2[3]*(2**3);
	Data2=Reg[count];
	//Read Register 15 
	Data15=Reg[15];

end

//Sequential Write
always@(posedge clk, negedge rst)
begin





end



endmodule
