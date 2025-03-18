interface counter_if(input logic iclk);
//   logic clk;
  logic reset, load;
  logic [3:0] up_counter;
  logic [3:0] down_counter;
  
  modport mod1(input reset, load, output up_counter);
  modport mod2(input reset, load, output down_counter);
endinterface

module up_cntr(counter_if.mod1 up_if, input logic dclk);
  always_ff @(posedge dclk or posedge up_if.reset)
    begin
      if(up_if.reset) begin
        up_if.up_counter <= 4'b0;
      end  
      else if(up_if.load)
        up_if.up_counter <= 4'b0101;   //5
      else begin
        up_if.up_counter <= up_if.up_counter + 1;
      end
    end
endmodule

module down_cntr(counter_if.mod2 down_if, input logic dclk);
  always_ff @(posedge dclk or posedge down_if.reset)
    begin
      if(down_if.reset) begin
        down_if.down_counter <= 4'b1111;
      end
      else if(down_if.load)
        down_if.down_counter <= 4'b1010;    //10
      else begin
        down_if.down_counter <= down_if.down_counter - 1;
      end
    end
endmodule

module top_tb;
  bit tclk = 0;
  counter_if intf(tclk);  //iclk = tclk
  
  up_cntr DUT1(intf.mod1, tclk);  //instantiate up module by passing intfce hndle
  down_cntr DUT2 (intf.mod2, tclk); //instantiate dut by passing intfce hndle
  
  initial begin
    tclk = 0;
    forever #5 tclk = ~tclk;
  end
  
  initial begin
    intf.reset = 1;
    #10 intf.reset = 0;
  end
  
  initial begin
    intf.load = 1;
//     intf.data = 4'b1010;
    #20 intf.load = 0;
  end
  
  initial begin
    $monitor("sim time: %0t, reset: %0d, load: %0d, up_counter: %0d, down_counter: %0d", $time, intf.reset, intf.load, intf.up_counter, intf.down_counter);
    #150 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
  
  

//interface counter_if(input logic iclk);
interface counter_if;
  logic clk;
  logic reset, load;
//   logic [3:0] data;
  logic [3:0] up_counter;
  logic [3:0] down_counter;
  
  /*modport mod1(input reset, load, output up_counter);
  modport mod2(input reset, load, output down_counter);
  */
  
  modport mod1(input clk, reset, load, output up_counter);
  modport mod2(input clk, reset, load, output down_counter);
endinterface

/*module up_cntr(counter_if.mod1 up_if, input logic dclk);
  always_ff @(posedge dclk or posedge up_if.reset)
  */
  
module up_cntr(counter_if.mod1 up_if);
  always_ff @(posedge up_if.clk or posedge up_if.reset)
    begin
      if(up_if.reset) begin
        up_if.up_counter <= 4'b0;
      end  
      else if(up_if.load)
        up_if.up_counter <= 4'b0101;   //5
      else begin
        up_if.up_counter <= up_if.up_counter + 1;
      end
    end
endmodule


/*module down_cntr(counter_if.mod2 down_if, input logic dclk);
  always_ff @(posedge dclk or posedge down_if.reset)
  */
  
module down_cntr(counter_if.mod2 down_if);
  always_ff @(posedge down_if.clk or posedge down_if.reset)
    begin
      if(down_if.reset) begin
        down_if.down_counter <= 4'b1111;
      end
      else if(down_if.load)
        down_if.down_counter <= 4'b1010;    //10
      else begin
        down_if.down_counter <= down_if.down_counter - 1;
      end
    end
endmodule
/*
module top_tb;
  bit tclk = 0;
  counter_if intf(tclk);  //iclk = tclk
  
  up_cntr DUT1(intf.mod1, tclk);  //instantiate up module by passing intfce hndle
  down_cntr DUT2 (intf.mod2, tclk); //instantiate dut by passing intfce hndle
  
  initial begin
    tclk = 0;
    forever #5 tclk = ~tclk;
  end
  */
  
module top_tb;
  counter_if intf();
  
  up_cntr DUT1(intf.mod1);  //instantiate up module by passing intfce hndle
  down_cntr DUT2 (intf.mod2); //instantiate dut by passing intfce hndle
  
  initial begin
    intf.clk = 0;
    forever #5 intf.clk = ~intf.clk;
  end
  
  initial begin
    intf.reset = 1;
    #10 intf.reset = 0;
  end
  
  initial begin
    intf.load = 1;
//     intf.data = 4'b1010;
    #20 intf.load = 0;
  end
  
  initial begin
    $monitor("sim time: %0t, reset: %0d, load: %0d, up_counter: %0d, down_counter: %0d", $time, intf.reset, intf.load, intf.up_counter, intf.down_counter);
    #150 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


      
        
        
        
  