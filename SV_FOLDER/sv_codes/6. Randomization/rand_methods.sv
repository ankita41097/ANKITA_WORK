class seq_item;
  rand bit [7:0] val1 = 70;
  rand bit [7:0] val2 = 10;
 
  constraint val1_c1 {val1 > 50; val1 < 90;}
  constraint val2_c2 {val2 > 10; val2 < 20;}
  
  function void pre_randomize();
    $display("Inside pre_randomize");
    $display("val1: %0d, val2: %0d", val1, val2);
    val2_c2.constraint_mode(0);
  endfunction
  
  function void post_randomize();
    $display("Inside post_randomize");
    $display("val1 = %0d, val2 = %0d", val1, val2);
  endfunction
endclass

class child_seq extends seq_item;
  
  function void pre_randomize();
    $display("Inside child class pre_randomize");
    $display("Val1: %0d, val2: %0d", val1, val2);
    val1_c1.constraint_mode(0);
  endfunction
  
  function void post_randomize();
    $display("Inside child class post_randomize");
    $display("val1: %0d, val2: %0d", val1, val2);
  endfunction
endclass

module test;
  seq_item item;
  child_seq ch_item;
  
  initial begin
    item = new();
    ch_item = new();
    
    item.randomize();
    ch_item.randomize();
  end
endmodule

**************************************************************************************************************

class rand_methods;
  rand bit [7:0] val1 = 70;
  rand bit [7:0] val2 = 10;
 
  constraint val1_c1 {val1 > 150; val1 < 260;}
  constraint val2_c2 {val2 > 40; val2 < 90;}
  
  function void pre_randomize();
    $display("Inside pre_randomize");
    $display("val1: %0d, val2: %0d", val1, val2);
    val2_c2.constraint_mode(0);
  endfunction
  
  function void post_randomize();
    $display("Inside post_randomize");
    $display("val1 = %0d, val2 = %0d", val1, val2);
  endfunction
  
endclass

module test;
  rand_methods m1;
  
  initial begin
    m1 = new();
    m1.randomize();
  end
endmodule
