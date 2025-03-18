module method;
  int packet[];

  initial begin
    packet = {67, 89, 24, 12, 1, 43, 90, 5};

    // Reverse the array
    packet.reverse();
    $display("Reverse: %0p", packet);

    // Sort the array
    packet.sort();
    $display("Sort: %0p", packet);

    // Sort the array in reverse order
    packet.rsort();
    $display("Rsort: %0p", packet);

    // Shuffle the array
    packet.shuffle();
    $display("Shuffle: %0p", packet);
  end
endmodule

module arr_redc;
  int packet1[];
  int res;

  initial begin
    packet1 = {5, 4, 7, 3, 9};

    res = packet1.sum();
    $display("Sum of elements = %d", packet1.sum);
    
    res = packet1.product();
    $display("product of elements = %d", packet1.product);
    
    res = packet1.and();
    $display("and of elements = %d", packet1.and);
    
    res = packet1.xor();
    $display("xor of elements = %d", packet1.xor);
  end
endmodule

module arr_loc;
  int a[8] = {10, 14, 18, 50, 33, 38, 7, 8};
  int q[$];
  
  initial
    begin
      q = a.min();
      $display("min value = %p", q);
      
      q = a.max();
      $display("max value = %p", q);
      
      q = a.unique();
      $display("unique value = %p", q);
      
      q = a.find_first with	(item % 2 == 0);
      $display("element = %p", q);
      
      q = a.find_last with	(item % 2 == 0);
      $display("element = %p", q);
      
      q = a.find_first_index with (item % 2 == 0);
      $display("element = %p", q);
      
      q = a.find_last_index with (item % 2 == 0);
      $display("element = %p", q);
    end
endmodule

module type_casting;
  real r_a;
  int i_a;
 
  initial 
    begin
      r_a = (2.1 * 3.2);
      $display("real num : %0d", r_a);
      i_a = int'(2.1 * 3.2);
      i_a = int'(r_a);
      
      $display("Real value is %0f", r_a);
      $display("Int value is %0d", i_a);
    end
endmodule

module width_casting;
  logic [3:0] a;
  int b;
  
  initial
    begin
      a = 8'b0000_1100;
      $display("a: %b", a);
      
      b = 8'b1010_0011;
      $display("b: %b", b);
    end
endmodule