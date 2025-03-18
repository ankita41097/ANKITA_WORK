class assertion_operators;
  rand  bit a1, b1, c1, d1, e1;
//   rand bit clk, reset;
  
endclass

module tb;
  assertion_operators op1 = new();
  bit tb_a1, tb_b1, tb_c1, tb_d1, tb_e1;
  bit clk, reset;
  
  //Assertions
  //onehot
  always @(posedge clk)
  assrt1: assert ($onehot(tb_a1))
    $info("pass:a1 is one-hot");
  else $error("fail:a1 is not one-hot");
  
  //$stable
  always @(posedge clk)
  assrt2: assert ($stable(tb_b1)) 
    $info("pass:b1 is stable");
  else $error("fail:b1 is not stable");
  
  //rose
  always @(posedge clk)
  assrt3: assert ($rose(tb_c1)) 
    $info("pass:c1 rose");
  else $error("fail:c1 didnt rise");
  
  //fell
  always @(posedge clk)
  assrt4: assert ($fell(tb_d1)) 
    $info("pass:a1 fell");
  else $error("fail:a1 did not fall");
  
  //changed
  always @(posedge clk)
    assrt5: assert ($changed(tb_e1))   
    $info("pass:b1 changed");
  else $error("fail:b1 did not change");
  
  //past
  always @(posedge clk)
  assrt6: assert (tb_a1 == $past(tb_a1)) 
    $info("PASS: Signal A matches the previous cycle");  
  else $error("FAIL: Signal A changed from the last cycle");

  //isunknown
  always @(posedge clk)
  assrt7: assert (!$isunknown(tb_c1))  
    $info("PASS: Signal C has a known value");  
  else $error("FAIL: Signal C contains an unknown value");
  
  initial begin
    forever #5 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    #10 reset = 0;
  end
  
  initial begin
    repeat(20) begin
      #20;
      assert(op1.randomize());
      $display("a1:%0d, b1:%0d, c1:%0d",op1.a1, op1.b1, op1.c1);
      tb_a1 = op1.a1;
      tb_b1 = op1.b1;
      tb_c1 = op1.c1;
      tb_d1 = op1.d1;
      tb_e1 = op1.e1;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #300 $finish;
  end  
endmodule
  
  
