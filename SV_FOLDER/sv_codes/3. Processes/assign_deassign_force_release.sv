module assign_deassign;
   
  reg [1:0]a1, a2;
    
    always 
      begin
        a1 = 2'b00; 
        a2 = 2'b10;
        $display("Step 1: Initial Values");
        $display("a1 = %0b, a2 = %0b", a1, a2);
        #10; 
        assign a1 = 2'b01; 
        $display("Step 2: After Procedural Assign to a1");
        $display("[%0t] a1 = %0b, a2 = %0b", $time, a1, a2);
        #10; // Wait for 10 time units
        
        // Step 3: Modify r2 without assign
        a2 = 2'b00; // Update r2 to 0, r1 should remain 1 due to previous assign
        $display("Step 3: After Changing a2");
        $display("[%0t] a1 = %0b, a2 = %0b",$time, a1, a2);
        #10; // Wait for 10 time units

        // Step 4: deassign r1 - releases procedural control over r1
        deassign a1; // Release the procedural assignment on r1, making it undefined
        $display("Step 4: After Deassign a1");
        $display("[%0t] a1 = %0b, a2 = %0b",$time, a1, a2);
        #10; // Wait for 10 time units

        // Step 5: Modify r1 again after deassign
        a1 = 2'b10; // Assign 0 to r1 after deassign
        $display("Step 5: After Modifying a1 Again");
        $display("[%0t] a1 = %0b, a2 = %0b",$time, a1, a2);

        #10; // Wait for 10 time units
      
        a1 = 2'b00;
        assign a1 = 2'b10;
        force a1 = 2'b11;
        $display("Step 6: After Modifying a1 Again");
        $display("[%0t] a1 = %0b",$time, a1);
        #5;
        release a1;
        $display("Step 7: After release a1 Again");
        $display("[%0t] a1 = %0b",$time, a1);
      end
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #65 $finish;
  end
endmodule