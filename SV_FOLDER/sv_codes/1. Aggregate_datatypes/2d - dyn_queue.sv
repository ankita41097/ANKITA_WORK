module tb_dyn_q;  
  int a[][$];
  //int removed_value;
  
  initial
    begin
      a = new[3];
      a[0] = {1, 2, 3};   
      a[1] = {4, 5};      
      a[2] = {6, 7, 8, 9};  
      $display("2D Array: %p",a);
      $display("Element at a[1][0]: %0d", a[1][0]); // 4  
      $display("Element at a[2][3]: %0d", a[2][3]); // 9

      a[1].push_back(50);  
      $display("2D Array after adding to a[1]: %p", a);
  
      a[0].pop_back();
      $display("Removed value from a[0]: %0p", a[0]);  
      $display("2D Array after removing from a[0]: %p", a);
      
      a[2].push_front(32);
      $display("2D array after adding to a[2]: %p", a);
      
      a[0].pop_back();
      $display("2D array after removing from a[0]: %p", a);
      
      a[1].delete();
      $display("2D Array after deleting a[1]: %p", a);

      a.delete();  
      $display("2D Array after clearing the arrays: %p", a);
    end
endmodule
