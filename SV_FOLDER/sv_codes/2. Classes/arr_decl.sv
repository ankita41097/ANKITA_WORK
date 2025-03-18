class array_decl;
    
  int fixed_arr[5];  
  int dyn_arr[];
  int q[$];            
  int asso[int];
  int size = 5;
    
//   function new();
//     foreach (fixed_arr[i]) begin
//       fixed_arr[i] = i + 10;
//     end
//   endfunction

  function void initialize(); 
    foreach (fixed_arr[i]) begin
      fixed_arr[i] = i * 10;
    end
    
    //int size = 5;
    dyn_arr = new[size];
    foreach (dyn_arr[i]) begin
      dyn_arr[i] = i * 2;
    end

    foreach (dyn_arr[i]) begin
      q.push_back(i * 3);
    end

    foreach (dyn_arr[i]) begin
      asso[dyn_arr[i]] = i; // Key: value from dynamic_array, Value: index
    end
  endfunction

  function void display();      
    int key; // Used to iterate over associative array keys
    $display("Fixed Array:");
    foreach (fixed_arr[i]) 
      $display(" [%0d] %0d", i, fixed_arr[i]);
    
    $display("Dynamic Array:");
    foreach (dyn_arr[i]) 
      $display(" [%0d] %0d", i, dyn_arr[i]);
    
    $display("Queue:");
    foreach (q[i]) 
      $display(" [%0d] %0d", i, q[i]);
    
    $display("Associative Array:");
    foreach (asso[key]) 
      $display(" Key[%0d] Value[%0d]", key, asso[key]);
  endfunction
endclass

module array;
  array_decl a1 = new();
  initial begin
    a1.initialize();
    a1.display();
  end
endmodule