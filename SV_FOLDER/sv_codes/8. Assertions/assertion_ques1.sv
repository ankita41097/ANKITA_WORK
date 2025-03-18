module clock_freq;
  realtime clk_period = 50;	
  bit clk, reset;
  //bit p;
      
  property time_clk;
    realtime current_time;   //to store the realtime
    
    disable iff (!reset)    
    (('1, current_time = $realtime) |=> (clk_period == $realtime-current_time));  
  endproperty
  
  assert_period : assert property (@(posedge clk)time_clk)
    begin
    //  p++;
      $display(" Assertion Passed. Clock period is correct at ",$realtime); 
    end
    else
      begin
        $error("Assertion Failed. Clock period is incorrect at ",$realtime);
      end
	  
	  
	initial begin
    clk = 0;
    forever #25 clk = ~clk;   
	end
  
	initial begin
    reset =0;
    #20 reset = 1;
    #300 $finish;
	end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule

