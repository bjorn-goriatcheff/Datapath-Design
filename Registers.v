module Registers(
	output reg[15:0] Data1,
	output reg[15:0] Data2,
	output reg[15:0] Data15,
	input [3:0] ReadAdd1,
	input [3:0] ReadAdd2,
	input [15:0] WriteReg1,
	input [15:0] WriteReg2,
	input [15:0] WriteReg15,
	input [1:0] WriteDst,
	input clk,
	input rst
);
//15 Registers
reg[15:0]Reg [15:0];
integer count1,count2, inc;
//Combinatorial READ
always@(*)
begin
	//Read Register from Address 1
	//count1=0;
	//count1=count1+ReadAdd1[0];
	//count1=count1+ReadAdd1[1]*(2**1);
	//count1=count1+ReadAdd1[2]*(2**2);
	//count1=count1+ReadAdd1[3]*(2**3);
	Data1=Reg[ReadAdd1];
	//Read Register from Address 2
	count2=0;
	count2=count2+ReadAdd2[0];
	count2=count2+ReadAdd2[1]*(2**1);
	count2=count2+ReadAdd2[2]*(2**2);
	count2=count2+ReadAdd2[3]*(2**3);
	Data2=Reg[count2];
	//Read Register 15 
	Data15=Reg[15];

end

//Sequential Write
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		for(inc=0;inc<16;inc=inc+1)
			Reg[inc]=16'h0000;
		Reg[1]=16'h0F00;
		Reg[2]=16'h0050;
		Reg[3]=16'hFF0F;
		Reg[4]=16'hF0FF;
		Reg[5]=16'h0040;
		Reg[6]=16'h6666;
		Reg[7]=16'h00FF;
		Reg[8]=16'hFF88;
		Reg[9]=16'h0000;
		Reg[10]=16'h0000;
		Reg[11]=16'h0000;
		Reg[12]=16'hCCCC;
		Reg[13]=16'h0002;
		
	end
	else if(WriteDst==2'b00)
		Reg[ReadAdd1]=WriteReg1;
	else if(WriteDst==2'b01)
	begin
		Reg[ReadAdd1]=WriteReg1;
		Reg[count2]=WriteReg2;
	end
	else if(WriteDst==2'b10)
	begin
		Reg[ReadAdd1]=WriteReg1;
		Reg[15]=WriteReg15;
	end
end
endmodule
