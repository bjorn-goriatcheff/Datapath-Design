`include "CPU.v"

module CPU_fixture;

// Declare variables for stimulating input
reg clk, rst;

initial
        $vcdpluson;

initial
begin
       $monitor();
       $display(); //PC, ADDERS, MEMORY, REGISTER FILE, ALU, pipeline buffers, etc. on negedge
end

// Instantiate the CPU
CPU c1(clk, rst);

// Setup the clock to toggle every 10 time units
initial
begin
       CLOCK = 1'b0;
       forever #10 CLOCK = ~CLOCK;
end

// Finish the simulation at time 500
initial
begin
       #500 $finish;
end

endmodule
