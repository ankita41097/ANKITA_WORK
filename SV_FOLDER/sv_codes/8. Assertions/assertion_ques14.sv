module assertion_test;
  bit clk;
  bit reset;
  bit signal_a, signal_b, signal_c, signal_d;
  bit [4:0] grant;
  bit req;
  
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    #20 reset = 0;
  end
  
  initial begin
    repeat(20) begin
      #20;
      std::randomize(grant, req, signal_a, signal_b, signal_c, signal_d);
      $display("Time:%0t -> grant:%0b, req:%0d, signal_a:%0d, signal_b:%0d, signal_c:%0d",$realtime, grant, req, signal_a, signal_b, signal_c, signal_d);
    end
  end
  
  initial begin
    #15;
    $assertkill();
    #5;
    $asserton();
    #10;
    $assertcontrol(4,1,1);
    #5;
    $assertcontrol(3,1,1);
  end
 
 p1: property ppt1;
    @(posedge clk) $onehot(grant);
  endproperty
  assrt1: assert property (ppt1)
    $info("pass: assertion passed");
    else $error("fail: More than one bit in grant is high!");

  property ppt2;
    @(posedge clk) signal_a |=> !signal_a;  
  endproperty
  assrt2: assert property (ppt2)
    $info("pass: assertion passed");
    else $error("fail: signal_a is high for more than one cycle!");
  
  property ppt3;
    @(posedge clk) disable iff(reset)
  (signal_a && signal_b) |=> !(signal_a && signal_b);
  endproperty  
  assrt3: assert property (ppt3)
    $info("pass: assertion passed");
    else $error("fail: signal_a and signal_b are high for more than one cycle");
    
  property ppt4;
    @(posedge clk) signal_a |-> (signal_b throughout (!signal_c && !signal_d));
  endproperty
  assrt4: assert property (ppt4)   
    $info("pass: assertion passed");  
    else $error("fail: signal_b did not stay high until signal_c or signal_d was asserted");
    
  property ppt5;
    @(posedge clk) disable iff(reset)
    signal_a |-> req ##3 grant ##1 !req ##1 !grant;
  endproperty
  assrt5: assert property (ppt5)
    $info("pass: assertion passed");
    else $error("fail: request and grant sequence did not follow the expected order");
    
  property ppt6;
  @(posedge clk) !reset [*6];
  endproperty
  assrt6: assert property (ppt6)
    $info("pass: assertion passed");
    else $error("fail: Reset was not held low for 6 cycles");
    
  assrt7: assert property (@(posedge clk) signal_a |-> $past(signal_b, 3))  
    $info("pass: assrt7 passed");
    else $error("fail: assertion failed");
    
  sequence s1;
    (signal_c[*2] ##1 signal_a);
  endsequence
    
  sequence s2;
    (signal_a[*2] ##1 signal_c);  
  endsequence
    
  property ppt;
    @(posedge clk)
    $rose(signal_d) |=> if(signal_b) s1
      else
        s2;
  endproperty
  assrt8: assert property (ppt)
    $info("assertion passed");
    else $error("assertion failed");
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #500 $finish;
    end  
endmodule

    
  
  
      
  
  
  
