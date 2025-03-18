module inter_delay_example;
  logic clk;
  logic [2:0] a, b, c, d;
  

  initial
    begin
      clk = 1;
    forever #5 clk = ~clk;
    end

  initial  begin 
    a = 3'b000;
    #5 a = 3'b001;
    #10 a = 3'b010;  
    $monitor("[%0t] Inter delay in blocking -> a=%0d, b=%0d, c=%0d, d=%0d", $time, a, b, c, d); 
    end

  initial begin
    b <= 3'b000;
    #5 b <= 3'b101;
    #5 b <= 3'b111;
    $monitor("[%0t] Inter delay in non blocking -> a=%0d, b=%0d, c=%0d, d=%0d", $time, a, b, c, d); 
    //$display("[%0t] Final value of b = %0d", $time, b);
  end

  initial begin
    c = 3'b000;
    c = #17 3'b110;
    $monitor("[%0t] Intra delay in blocking -> a=%0d, b=%0d, c=%0d, d=%0d", $time, a, b, c, d); 
    //$display("[%0t] Value of c = %0d (after intra-delay)", $time, c);
  end
  
  initial begin
    d <= 3'b000;
    d <= #20 3'b111;
    $monitor("[%0t] Intra delay in non blocking -> a=%0d, b=%0d, c=%0d, d=%0d", $time, a, b, c, d); 
    //$display("[%0t] Value of d = %0d (immediate)", $time, d);
    //$display("[%0t] Value of d = %0d (after intra-delay)", $time, d);
  end 
endmodule
