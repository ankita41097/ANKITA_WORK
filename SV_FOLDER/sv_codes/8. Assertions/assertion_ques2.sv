module assertion_test;
  
  reg clk, reset;
  reg [7:0] data;
  reg enable = 0;
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  initial begin
    reset = 1;
    #30 reset = 0;
    #200 $finish;
  end
  
  initial begin
//     repeat(10) begin
//       std::randomize(data, enable);
//       $display("At time:%t, clk:%b, reset:%b, enable:%b,  data:%h", $time , clk, reset, enable, data);
//   end
//   end
    
    enable = 0;
    data = 8'haa;
    #40 enable = 1;
    #20 data = $urandom_range(0, 255); 
    #20 enable = 0;
//     #20 data = $urandom_range(0, 255);
    #20 enable = 1;
//     data = $urandom_range(100, 255); 
    #10 data = $urandom_range(1, 50);   
  end
  
  property data_stability;
    @(posedge clk) disable iff (reset)
    $rose(enable) |-> $stable(data);  //after (en) is high, data should be stable
  endproperty
  
  assert_data_stability: assert property (@(posedge clk) data_stability)
    begin
      $display("%t INFO: Assertion passed", $realtime);
    end  
    else 
      begin
        $error(" %t INFO: Data chnged while enable is high", $realtime);
      end
    
    initial begin
      $monitor("At time:%t, clk:%b, reset:%b, enable:%b,  data:%h", $time , clk, reset, enable, data);
    end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars; 
    end
    endmodule
          

  
    
    
