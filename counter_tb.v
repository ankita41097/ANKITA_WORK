`timescale 1ns/1ps

module counter_tb;
    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the design under test (DUT)
    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    initial begin
        // Dump waveform data for GTKWave
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);

        // Initialize signals
        clk = 0;
        reset = 1;
        #10 reset = 0; // Release reset after 10 time units

        // Run simulation for 100 time units
        #100;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t, Count = %0d", $time, count);
    end
endmodule

