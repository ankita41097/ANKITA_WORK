class randvar;
  rand bit [7:0] var1, var2, var3, var4, var5, var6, var7, var8;
  
  function void pre_randomize();
    $display("value before randomize");
    $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t VAR8 = %0d ",var1, var2, var3, var4, var5, var6, var7, var8);
  endfunction
  
  function void post_randomize();
    $display("value after randomize");
    $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t VAR8 = %0d ",var1, var2, var3, var4, var5, var6, var7, var8);
  endfunction
  
  constraint C1{var1 inside {[10:20]}; }
  constraint C2{var2 < 15;}
  constraint C3{var7 == var2;}
  constraint C4{unique {var7};}
  
endclass

module rand_methods;
 initial 
   begin
     randvar pkt;
     pkt = new();
     
//     pkt.rand_mode(1);
     
     pkt.var1.rand_mode(1);
     pkt.var3.rand_mode(0);
     pkt.var4.rand_mode(1);
     
     pkt.C1.constraint_mode(0);

     pkt.randomize();
     pkt.randomize() with { var2 == 8;};
//      $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t VAR8 = %0d ",pkt.var1, pkt.var2, pkt.var3, pkt.var4, pkt.var5, pkt.var6, pkt.var7, pkt.var8);
     end
  endmodule

