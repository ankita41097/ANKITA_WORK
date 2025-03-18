module clk_tb;
  bit clk1;
  bit clk2;
  bit reset;
  logic a, b;
 
  property ppt1;
    @(posedge clk1) disable iff(reset)
    a |=> @(posedge clk2) b;
  endproperty
  assrt1: assert property (ppt1)
    $info("PASS: a changed with b");
    else $error("FAIL: a changed without b");
    
//    property ppt2; 
//      @(posedge clk2 or posedge clk1) disable iff(reset)
//      ($fell(b) |=> ##2 $rose(a));  
//    endproperty
//    assrt2: assert property (ppt2) 
//      $info("PASS: b changed every 2 clk cycles");
//      else $error("FAIL: b didnt change correctly");
  
     initial begin
       clk1 = 0;
       forever #50 clk1 = ~clk1;  //f = 10MHz -> T=100ns
     end
 
     initial begin   
       clk2 = 0;
       forever #25 clk2 = ~clk2;  //f = 20MHz -> T=50ns
     end
     
     initial begin
       reset = 1;
       #50 reset = 0;
     end
     
     initial begin
       repeat(50) begin
         #60;
//          @(posedge clk1 or posedge clk2)
          a = $urandom_range(0,1);
          b = $urandom_range(0,1);
         $display("at time %0t a:%0d, b:%0d",$time, a, b);
       end
     end
       
     initial begin
       $dumpfile("dump.vcd");
       $dumpvars;
       #1000; 
       $finish;
     end
     endmodule    
  
