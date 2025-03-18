class test;
  int a;
  int b;
  
  extern function new();
  extern function void display();
  extern task delay();
endclass
    
  function test::new();
    a = 10;
    b = 20;
  endfunction
  
  function void test::display();
    $display("a: %0d, b: %0d", a, b);
  endfunction
    
    
  task test::delay();  
    #50;
    $display("Time = %0.0t, delayed values = %0d, %0d", $time, a, b);  
  endtask

module tb;
  test t1;
  test t2;
  initial
    begin
      t1 = new();
      t1.display();
      t1.delay();
    end
endmodule

