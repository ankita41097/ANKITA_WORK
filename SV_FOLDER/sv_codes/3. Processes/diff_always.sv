module tb_always;

  // Signals
  logic clk, reset, enable;            // Clock and reset
  logic [3:0] data_in, data_out;           // Combinational AND result
  logic [3:0] latch_result;         // Output from a latch
  logic [3:0] counter;         // Sequential counter
  logic [3:0] comb_out;

  
  // Clock generation
  initial begin: clk_gen
      forever #5 clk = ~clk;      // Clock toggles every 2 time units
    end
  
  initial begin: rst_signal
    reset = 1;
    #15 reset = 0;
  end
  
  initial begin: initialize
    enable = 0;
    data_in = 4'b0011;
    #30 enable = 1;
    #40 enable = 0;
  end
  
  // always Block
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      counter <= 0;          // Reset counter to 0
    $display("Reset: %0t",$time);
  end
    else if(enable) begin
      counter <= counter + 1; // Increment counter on every clock cycle
    $display("[%0t] Counter value: %0d",$time, counter);
  end
  end
  
  //always_comb block
  always_comb begin: combinational_output
    comb_out = data_in + 4'b0101;
    $display("[%0t] Combinational output: %0d", $time, comb_out);
  end

  // always_latch block
  always_latch begin: latched_data
    if (enable)
      latch_result = data_in;
    $display("[%0t] Latch result: %0d", $time, latch_result);
  end

  // always_ff block
  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      data_out <= 0;
      $display("Reset: %0t",$time);
    end
    else begin
      data_out <= data_in;
      $display("[%0t] Data out: %0d",$time, data_out);
    end
  end
  
  initial begin
    #100 $finish;
  end
  
endmodule
