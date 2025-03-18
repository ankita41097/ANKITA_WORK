module rand_mode_vars();
 
  bit[7:0] var1, var2, var3, var4;
  bit[5:0] var5;
  bit[3:0] var6;
  bit[3:0] array[6];
  bit[3:0] var8;
  bit[3:0] var9; 
  bit[2:0] len;
  
  initial begin
    repeat(3) begin
      std::randomize(var1, var2, var3, var4, var5, var6, var8, var9, len) with {var1 inside {[10:20]};soft var2 inside {[20:40], 45, [46:50]}; 
	  var3 dist {[30:35] := 3}; 
	  var5 < 63 ; var5 > 50; var6 < 10; var8 == 10 -> var2 < 20;};
                     
      $display("Inside post-randomize: \tvar1 = %0d, \tvar2 = %0d, \tvar3 = %0d, \tvar4 = %0d, \tvar5 = %0d, \tvar6 = %0d, \tvar8 = %0d, \tlen = %0d \tvar9 = %0d", var1, var2, var3, var4, var5, var6, var8, len, var9);    
      foreach(array[i])
        $display("array[%0d] = %0d", i, array[i]); 
    end
  end  
endmodule
