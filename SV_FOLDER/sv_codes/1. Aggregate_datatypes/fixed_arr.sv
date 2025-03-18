module tb;
  byte a[5];
  initial
    begin
      foreach(a[i])
        begin
          a[i] = $random;
          $display("%0h to index %0d", a[i], i);
        end
      $display("values of a = %p",a);
    end
endmodule
  
