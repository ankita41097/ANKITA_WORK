module asso_2d;
  int array[string][int];

  initial
    begin
      
    
      array["Ankita"][0] = 10;
      array["Priti"][1] =  20;
      array["Sushanki"][2] = 30;
      array["Rishi"][3]    = 40;
      array["Kartik"][4]   = 50;
      array["Shiv"][5]     = 60;

    // Display the entire 2D associative array
    $display("2D Associative Array Contents:");
      foreach (array[i,j])
        $display("array[%s][%0d] = %0d", i,j,array[i][j]);
    end
  
    //$display("Access Specific Elements:");
  $display("array['ankita'][0] = %0d", array["ankita"][0]); // Output: 10
  $display("array['rishi'][3] = %0d", array["rishi"][3]); // Output: 40
  $display("array['kartik'][4] = %0d", array["kartik"][4]); // Output: 50

    // Modify an element
  array["priti"][1] = 25;
  $display("Modified array['priti'][1]: %0d", array["priti"][1]); // Output: 25

    // Check if a key exists
  if (array.exists("Sushanki")) begin
    $display("Sushanki exists in the array.");
    end else begin
      $display("Sushanki does not exist in the array."); // Expected output
    end
  end

endmodule
