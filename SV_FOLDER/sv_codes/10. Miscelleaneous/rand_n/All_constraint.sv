class randvar;
  rand bit [7:0] var1, var2, var5, var6, var7;
  randc bit [2:0] var3, var4;
  rand bit [3:0] addr;
  rand bit       a;
  rand bit [3:0] b;
  
  function void pre_randomize();
    $display("value before randomize");
    $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t addr = %0d \t a = %0d \t b = %0d",var1, var2, var3, var4, var5, var6, var7, addr,a,b);
  endfunction
  
  function void post_randomize();
    $display("value after randomize");
    $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t addr = %0d \t a = %0d \t b = %0d",var1, var2, var3, var4, var5, var6, var7, addr,a,b);
  endfunction
  
  constraint C1{var1 inside {[10:20]}; }
  constraint C2{var2 < 15;}
  constraint C3{var7 == var2;}
  constraint C4{unique {var7};}	// unique mainly works where a variable can take multiple values like arrays
  
  constraint addr_range { addr dist { 2 := 5, 7 := 8, 10 := 12 }; }
  constraint a_b { (a == 1) -> b == 0; }
  
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

//     pkt.randomize();
     repeat (10)begin
     pkt.randomize() with { var2 == 8;}; // inline constraint 
//      $display("\t VAR1 = %0d \t VAR2 = %0d \t VAR3 = %0d \t VAR4 = %0d \t VAR5 = %0d \t VAR6 = %0d \t VAR7 = %0d \t VAR8 = %0d ",pkt.var1, pkt.var2, pkt.var3, pkt.var4, pkt.var5, pkt.var6, pkt.var7, pkt.var8);
       $display("Randomization Successfull");
     end
     end
  endmodule

