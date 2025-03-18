module assertion_local;
  bit clk, reset;
  logic a, b, c, d, e;
 
  sequence seq1;
    int p,q;
    (a, p = b, q = c) ##1 (p + q == 2);
endsequence
  
  property ppt1;
    @(posedge clk) seq1;
  endproperty
  assrt1: assert property (ppt1)
    $info("assertion passed");
    else $error("assertion failed");
    
  sequence seq2;
    int x,y,z;
    (a, x = c, y = d, z = e) ##3 (x + y + z == 3);
  endsequence
  
  property ppt2;  
    @(posedge clk) seq2;
  endproperty
  assrt2: assert property (ppt2)
      $info("assertion passed");
      else $error("assertion failed");
      
  function logic and_op(logic a, logic b);
    return (a && b); // Function returns true only if both signals are high  
  endfunction

  property ppt_function;
    @(posedge clk) disable iff(reset)
    and_op(a,b) |-> c;  
  endproperty
  assrt3 : assert property (ppt_function)
    $info("assertion passed");
    else $error("assertion failed");
    
   
    initial begin
      clk = 0;
      forever #10 clk = ~clk;
    end
  
  
    initial begin
      reset = 1;
      #10 reset = 0;
    end
  
    initial begin
      repeat(20) begin
        #20;
        std::randomize(a,b,c,d,e);
        #10;
        $display("a:%0d, b:%0d, c:%0d, d:%0d, e:%0d",a,b,c,d,e);
      end
    end
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #500 $finish;
    end
    endmodule
  