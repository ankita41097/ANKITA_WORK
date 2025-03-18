module assign_deassign;
  logic [3:0] var1;
  
  initial begin
    $monitor("At time T = %0t: var1 = %0d", $time, var1);
    var1 = 6;
    #20 var1 = 10;
  end
  
  initial begin
    #5 assign var1 = 15;
    #5 deassign var1;
    $display("At time T = %0t: deassign var1: %0d", $time, var1);
    #6 assign var1 = 4;
    $display("At time T = %0t: assign var1: %0d", $time, var1);
    #6 deassign var1;
    $display("At time T = %0t: deassign var1: %0d", $time, var1);
    
    
  end
  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars;
  end
endmodule