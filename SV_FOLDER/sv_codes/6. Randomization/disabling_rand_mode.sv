class rand_mode_vars;
  rand bit[7:0] var1, var2, var3, var4;
  rand bit[5:0] var5;
  rand bit[3:0] var6;
  
  constraint c1 {var1 inside {[10:20]};}  //10-20
  constraint c2 {var2 inside {[20:40], 45, [46:50]};}
  constraint c3 {var3 dist {[30:35] := 3};}     //25-35 = 5(each)
  constraint c4 {var4 dist {[80:100] :/ 10};}  //20/10 = 2(each)
  constraint c5 {var5 < 63 ; var5 > 50;}
  constraint c6 {unique {var6};}
  
  function void pre_randomize();
    $display("Inside pre-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d, \tvar5 = %0d, \tvar6 = %0d", var1, var2, var3, var4, var5, var6);
  endfunction
  
  function void post_randomize();
    $display("Inside post-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d, \tvar5 = %0d, \tvar6 = %0d", var1, var2, var3, var4, var5, var6);
  endfunction
endclass

module top;
  rand_mode_vars m1;
  initial begin
    m1 = new();
    repeat(3) begin
//    m1.randomize();  
    m1.var1.rand_mode(0);
    m1.var3.rand_mode(0);
    m1.var5.rand_mode(0); 
    
    m1.c1.constraint_mode(0);
    m1.c3.constraint_mode(0);
    m1.c5.constraint_mode(0);
    m1.randomize();
//        $display("Inside post-randomize: \nvalue of var1 = %0d, \nvar2 = %0d, \nvar3 = %0d, \nvar4 = %0d, \nvar5 = %0d, \nvar6 = %0d", m1.var1, m1.var2, m1.var3, m1.var4, m1.var5, m1.var6);
      
    end
  end
endmodule