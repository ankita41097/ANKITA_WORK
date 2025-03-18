module assertion_tb;
  bit clk;
  bit reset;
  bit valid;
  bit ready;
  logic[3:0] size = 4'bx;
  logic valid_1 = 1'bx, ready_1 = 1'bx;
  
  //whenever valid goes high it should be same until ready becomes high
  property ppt_1;
    @(posedge clk) disable iff(reset)
    (valid && !ready) |=>  ($stable(valid) throughout ready);
  endproperty
  
  assrt_1: assert property (ppt_1)  
    $info("%t, Assertion ppt_1 passed", $realtime);
    else $error("%t, assertion ppt_1 failed, Valid should be high till ready becomes high",$realtime);
    
    
  //valid and ready both should be high for one clock cycle
   property ppt_2;
     @(posedge clk) disable iff(reset) 
     (valid && ready) |=> ($fell(valid) && $fell(ready));  
   endproperty
     
   assrt_2: assert property (ppt_2)
     $info("%t, Assertion  ppt_2 passed", $realtime); 
     else $error("%t, Assertion ppt_2 failed. Valid and Ready should be high for one clk cycle", $realtime);
      
   //whenever valid is high, signal size should not get x(unknown) value   
   property ppt_3;   
     @(posedge clk) disable iff(reset)
//         (valid) |->  !$isunknown(size);   
     (valid) |=>  !$isunknown(size);   
   endproperty
     
   assrt_3: assert property (ppt_3)
     $info("%t, Assertion ppt_3 passed", $realtime);
     else $error("%t Assertion ppt_3 failed, size should not get unknown value", $realtime);
        
    //valid and ready when not in reset, should not get x value
    property ppt_4;
      @(posedge clk) disable iff(reset)
      !$isunknown(valid_1 && ready_1); 
    endproperty
        
    assrt_4: assert property (ppt_4)
      $info("%t, Assertion ppt_4 passed", $realtime);
      else $error("%t Assertion ppt_4 failed, valid and ready should not get unknown value", $realtime);
      
      //initialize clk
      initial begin
        clk = 0;
        forever #10 clk = ~clk;
      end
  
      //reset
      initial begin
        reset = 1;
        #20 reset = 0;
      end
  
      //generate stimulus
      initial begin
        repeat(20) begin
          @(posedge clk)   
          std::randomize(valid, ready, valid_1, ready_1);
//           std::randomize(valid, ready);
//           $display("%t clk:%0d, reset:%0d, valid:%0d, size:%0d", $time, clk, reset, valid, size);
          $display("%t clk:%0d, reset:%0d, valid:%0d, ready:%0d, size :%0d, valid_1:%0d, ready_1:%0d", $time, clk, reset, valid, ready, size, valid_1, ready_1);
        end
      end
  
      initial begin
        repeat(20) begin
          #3 size=$urandom%8;
          #10 size=4'bx;
          #15 size=$urandom%6;
          #20 size= 4'bx;
        end 
      end
   
      initial begin
        $dumpfile("dump.vcd");
        $dumpvars;  
        #500 $finish;
      end
      endmodule
          

          
          
          
          
          
          
          
          
          
          
          
      
      
    
    
    
    
      
  
  
    
    
  
  
  
