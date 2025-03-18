module queue_2d;
  int q[$][$];
  int removed_row[];
  
  initial
    begin  
    
      q.push_back({10, 20, 30});     // Add first row
    
      q.push_back({40, 50, 75});         // Add second row
    
      q.push_back({60, 70, 80}); // Add third row
    
      $display("2D Queue after push back: %p", q);  
    
      $display("Step 2: Element at q[0][1]: %0d", q[0][1]); // Access 20  
    
      $display("Step 2: Element at q[0][2]: %0d", q[0][2]); // Access 90
    
      $display("any: Element at q[0][2]: %p", q[0]); // Access 90
        // Step 3: Modifying elements
    q[1][0] = 45; // Modify the first element of the second row to 45
    q[2][2] = 85; // Modify the third element of the third row to 85
    $display("Step 3: 2D Queue after modifications: %p", q);
        // Step 4: Adding a new row to the front
    q.push_front({5, 15}); // Add a new row to the start
    $display("Step 4: 2D Queue after push_front: %p", q);
        // Step 5: Removing rows
 //  int removed_row[$][$];
  //  q.pop_back();
    //$display("any 1: 2D Queue after deleting second row: %p", q);
    removed_row = q.pop_back(); // Remove the last row
    $display("Step 5: Removed row from back: %p", removed_row);
    $display("Step 5: 2D Queue after pop_back: %p", q);
        // Step 6: Deleting specific rows
  //  */   
    q.delete(1); // Delete the second row (index 1)
    $display("Step 6: 2D Queue after deleting second row: %p", q);
        // Step 7: Clearing the queue
    q.delete(); // Clear all rows
    $display("Step 7: 2D Queue after clearing: %p", q);  
  end
endmodule