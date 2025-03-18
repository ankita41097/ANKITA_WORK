module deposit_eg;
  reg [3:0] data;

  initial begin
    data = 4'b0000;
    $display("[%0t] Initial value: data = %0b", $time, data);

    #5;
    $deposit(data, 4'b1010); // Force data to 1010
    $display("[%0t] After $deposit: data = %0b", $time, data);

    #5;
    data = 4'b1111; // Procedural assignment
    $display("[%0t] After procedural assignment: data = %0b", $time, data);

    #5;
    $deposit(data, 4'b0101); // Force data to 0101
    $display("[%0t] After second $deposit: data = %0b", $time, data);
  
    #5;
    assign data = 4'b1011;
    $display("[%0t] After assigning: data = %0b", $time, data);
    
    #5;
    deassign data;
    $display("[%0t] After deassigning: data = %0b", $time, data);
    
    #10; 
    force data = 4'b1001;
    $display("[%0t] After forcing: data = %0b", $time, data);
    
    release data;
    $display("[%0t] After releasing: data = %0b", $time, data);
    
    assign data = 4'b1111;
    $display("[%0t] After assigning: data = %0b", $time, data);
  end
endmodule

// module deposit2;
//   logic [7:0] var1;

//   initial begin
//     assign var1 = 8'hFF;
//     $display("[%0t] Initial assigned value: var1 = %0h", $time, var1);

//     #5;
//     $deposit(var1, 8'hAA);
//     $display("[%0t] After $deposit: var1 = %0h", $time, var1);

//     #5;
//     deassign var1; // Release continuous assignment
//     $display("[%0t] After deassign: var1 = %0h", $time, var1);

//     #5;
//     $deposit(var1, 8'h55); // Force value 55
//     $display("[%0t] After $deposit with no assign: var1 = %0h", $time, var1);
//   end
// endmodule
