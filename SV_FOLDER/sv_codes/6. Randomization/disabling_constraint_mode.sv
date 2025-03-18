class constraint_mode_vars;
  rand bit[7:0] var1; 
  rand bit[4:0] var2;
  rand bit[4:0] var3;
  rand bit[3:0] var4;
  
  constraint c1 {var1 inside {[10:20]};}  //10-20
  constraint c2 {var2 < 25;}
  constraint c3 {var3 == var1;}
  constraint c4 {var4 inside {[8:15]};}
  
  function void pre_randomize();
    $display("Inside pre-randomize:");
//     $display("Inside pre-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d,", var1, var2, var3, var4);
  endfunction
  
  function void post_randomize();
    $display("Inside post-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d", var1, var2, var3, var4);
  endfunction
endclass

module top;
  constraint_mode_vars m1;
  initial begin
    m1 = new();
    repeat(3) begin
//    m1.randomize();  
    
      m1.c1.constraint_mode(0);
      m1.c3.constraint_mode(0);
      m1.c4.constraint_mode(0);
      m1.c3.constraint_mode(1);
      m1.randomize();  
    end
  end
endmodule
