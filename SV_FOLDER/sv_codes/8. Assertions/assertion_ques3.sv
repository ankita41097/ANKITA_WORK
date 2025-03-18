class test;
  rand bit gnt;
  rand bit req;
endclass

module tb;
  test t1 = new();
  bit req;
  bit gnt;
  bit clk = 0;
  bit reset;
  
//   t1 = new();
  initial begin
    forever #10 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    #20 reset = 0;
  end
  
  initial begin
    repeat(50) begin
      #20;
      t1.randomize();
      $display("at time: %0t, req:%0d, gnt:%0d",$time, t1.req, t1.gnt);
      req = t1.req;
      gnt = t1.gnt;
    end
    #300 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  property ppt;
    @(posedge clk) disable iff(reset)
    (req) |=> ##[5:7] gnt;
//     $rose(req) |=> ##[5:7] gnt;
  endproperty
  
  sig_a: assert property (@(posedge clk) ppt)
    begin
      $display("%t assrtion passed", $realtime);
    end
    else
      begin
        $error("%t assertion failed", $realtime);
      end
    endmodule    
    
  
    
  
