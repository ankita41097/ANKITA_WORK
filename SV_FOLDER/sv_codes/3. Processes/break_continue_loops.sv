module break_continue_eg;
  int array[10];
  
  initial begin
    // Update array
    for (int i = 0; i < $size(array); i++) begin
      array[i] = i*i;
    end
  
    // Break keyword
    for (int i = 0; i < $size(array); i++) begin
      if(i == 6) break;
      $display("array[%0d] = %0d", i, array[i]);
    end
    $display("------------------------");
    
    // Continue keyword
    for (int i = 0; i < $size(array); i++) begin
      if(i == 6) continue;
      $display("array[%0d] = %0d", i, array[i]);
    end
    $display("------------------------");
  end
endmodule


module break_continue_eg;
  int array[10];
  
  initial begin
    // Update array
    for (int i = 0; i < $size(array); i++) begin
      array[i] = i*i;
    end
  
    // Break keyword
    for (int i = 0; i < $size(array); i++) begin
      if(i == 6) break;
      $display("array[%0d] = %0d", i, array[i]);
    end
    $display("------------------------");
    
    // Continue keyword
    for (int i = 0; i < $size(array); i++) begin
      if(i == 6) continue;
      $display("array[%0d] = %0d", i, array[i]);
    end
    $display("------------------------");
  end
endmodule