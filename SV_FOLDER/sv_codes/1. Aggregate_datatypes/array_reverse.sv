module arr_rev;
  int a[];
  int b[];
  
  initial
    begin
      a = new[100];
      foreach(a[i])
        begin
          a[i] = i + 1;
          //$display("array: %p", a);
        end
      b = a;
      for(int j=0; j<=100; j=j+10)      //increment every 10 elements
        begin
          for(int k=0; k<=9; k++)       //iterates for 9 elements
            begin
              a[j+k] = b[j+9-k];        //reverse the element
            end
        end
      $display("array: %p", a);
      $display("new array: %p", b);
    end
endmodule
      
