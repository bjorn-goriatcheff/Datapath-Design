`include "Memory.v"

module Module_Fixture;

wire [7:0] B;
wire [15:0] W;
reg [15:0]A;
reg [15:0]WW;
reg [7:0]WB;
reg [1:0]MW;
reg C;
reg R;

initial
  $vcdpluson;

initial
  $monitor($time," Input W = %h, Input B = %h, Address = %h, Output W = %h, Output B = %h, ctrl = %b", WW, WB, A, W, B, MW);

Memory a1(B,W,A,WW,WB,MW,C,R);

initial
begin
  R=0;
  #10;
  R=1;
//lw
  MW=2'b00;
  A=16'h0006;
  #10;
//lw
  A=16'h0008;
  #10;
//sb
  MW=2'b01;
  A=16'h0000;
  WB=8'h0F;
  #10;
//lb
  MW=2'b00;
  A=16'h0000;
  #10;
//sw
  MW=2'b10;
  A=16'h0006;
  WW=16'h000A;
  #10;
//lw
  MW=2'b00;
  A=16'h0006;
  #10;
//lb
  MW=2'b00;
  A=16'h0000;
end

initial
begin
  C = 1'b0;
  forever #10 C = ~C;
end

initial
begin
  #100 $finish;
end
endmodule
