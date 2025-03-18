module counter (
  input logic clk,
  input logic reset,
  input logic up_down,   
  output logic [3:0] count
);
  always_ff @(posedge clk) begin
    if (reset)
      count <= 4'b0000;
    else if (up_down)    // 1 for Up, 0 for Down
      count <= count + 1;
    else
      count <= count - 1;
  end
endmodule

module counter_assertion (
  input logic clk,
  input logic reset,
  input logic up_down,
  input logic [3:0] count
);
  
  property ppt1;
    @(posedge clk) disable iff (!reset)
    reset |-> (count == 4'b0000);
  endproperty
  assrt1: assert property (ppt1)
    $info("Reset assertion passed");
    else $error("Reset assertion: count is not 0");

  // Up mode: count should increment
  property ppt2;
    @(posedge clk) disable iff(reset)
    up_down |=> (count == $past(count) + 1);
  endproperty
  assrt2: assert property (ppt2)
    $info("Assertion passed");
    else $error("Assertion failed");

  // Down mode: count should decrement
  property ppt3;
    @(posedge clk) disable iff(reset)
    !up_down |=> (count == $past(count) - 1);    //up_down = 0
  endproperty
  assrt3: assert property (ppt3)
    $info("Assertion passed");
    else $error("Assertion failed");
endmodule

module counter_tb;
  logic clk, reset, up_down;
  logic [3:0] count;

  // Instantiate dut
  counter dut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
  );

  // Bind the assertion module
  bind counter counter_assertion assert_inst(
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
  );

  always #25 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    up_down = 1;
    repeat(3) @(posedge clk);
    reset = 0;    
    repeat(20) begin
      @(posedge clk);
      up_down = $random;
    end
  end

  initial begin
    $dumpfile("wave.vcd");
//     $dumpvars(0, counter_tb);
    $dumpvars;
    #1500 $finish;
  end
endmodule

