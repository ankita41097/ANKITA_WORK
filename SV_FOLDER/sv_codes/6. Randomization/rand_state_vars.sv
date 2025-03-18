class rand_state_vars;
  bit[7:0] var1; 
  bit[4:0] var2;
  bit[3:0] var3;
  bit[2:0] var4;
  
//   constraint c1 {var1 inside {[10:20]};}  //10-20
//   constraint c2 {var2 < 25;}
//   constraint c3 {var3 == var1;}
//   constraint c4 {var4 inside {[8:15]};}
  
//   function void pre_randomize();
//     $display("Inside pre-randomize:");
//     $display("Inside pre-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d,", var1, var2, var3, var4);
//   endfunction
  
//   function void post_randomize();
//     $display("Inside post-randomize: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d", var1, var2, var3, var4);
//   endfunction
endclass

module top;
  rand_state_vars s1;
  initial begin
    s1 = new();
    repeat(3) begin
    std::randomize(s1.var1, s1.var2, s1.var3, s1.var4) with {s1.var1 inside {[10:20]}; s1.var2 < 25;};
    $display("After randomization: \tvalue of var1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d", s1.var1, s1.var2, s1.var3, s1.var4);
    end
  end
endmodule

