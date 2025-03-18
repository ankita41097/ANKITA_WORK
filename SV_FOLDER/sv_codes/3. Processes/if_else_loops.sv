module if_else1;  
  initial begin
    int a, b;
    
    a = 10;
    b = 20;

    if(a > b)
      $display("a is greater than b");
    else if(a < b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
  end
endmodule

module while_1;  
  int count;
  initial begin
    while(count<10) begin 
      $display("Value of count = %0d", count);
      count++;
    end
  end
endmodule

module do_while_1;  
  int count = 2;
  initial begin
    do begin 
      $display("Count = %0d", count);
      count++;
    end
    while(count<1);
  end
endmodule

module do_while_2;  
  int count;
  initial begin
    do begin 
      $display("Count value = %0d", count);
      count++;
    end
    while(count<10);
  end
endmodule

module forever_eg;  
  int count;
  initial 
    begin
      forever 
        begin 
          $display("[%0t] Value of count = %0d",$time, count);
          count++;
          #5;
        end
    end
  initial begin
    #30;
    $finish;
  end
endmodule

module forever_using_break;  
  int count;
  initial begin
    forever begin 
      $display("[%0t] count = %0d",$time, count);
      count++;
      if(count == 7)
        break;
    end
  end
endmodule

module foreach_1d;
  int size = $urandom_range(1,5);
  int array[];
  initial begin
    array = new[size];
    foreach (array[i]) begin
      array[i] = i * 10;
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule

module foreach_2d;
  int array[][];
  int size = $urandom_range(1,5);
  initial begin
    array = new[2];
    foreach (array[i])
      begin
        array[i] = new[size];
        $display("size: %0d", size);
        foreach (array[i,j]) begin
          array[i][j] = i*2 + j*5;
          $display("array[%0d][%0d]: %0d", i,j, array[i][j]);
        end
      end    
  end
endmodule

module foreach_3d;
  int array[][][];
  int s = $urandom_range(1,5);
  int size = $urandom_range(1,5);
  initial begin
    array = new[2];
    foreach (array[i]) begin  
      array[i] = new[size];  
      $display("size: %0d", size);  
      foreach (array[i,j]) begin
        array[i][j] = new[s];
        $display("size of s: %0d", s);
        foreach (array[i,j,k]) begin
          array[i][j][k] = 10*i + 10*j + k;  
          $display("array[%0d][%0d][%0d]: %0d", i,j,k, array[i][j][k]);
        end
      end  
    end    
  end
endmodule

