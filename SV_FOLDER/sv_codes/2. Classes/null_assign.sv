class test;
  int a;
  int b;
  
  function new(int a1=0, int b1=0);
    a = a1;
    b = b1;
  endfunction
    
  function void display();
    $display("a: %0d, b: %0d", a, b);
  endfunction
  
endclass

module test_class;
  test t1;  //default value is null
  test t2;
  test t3 = null;   //explicitly assign null
  test t4 = new (2,5);  //create an object with paramaterized
  test t5 = new();
  
  initial begin
    if(t1 == null) begin
      $display("test t1 is null");
      t1 = new();
      t1.display();
    end
    
    if(t2 != null) begin
      $display("test t2 is not null");
    end
    else begin
      t2 = new(2, 3);
    end
    t2.display();
    
  if(t3 == null) begin
    $display("t3 is explicitly called as null");
    t3 = new(25, 60);
    t3.display(); 
  end
   
    $display("values of a and b");
    t4.display();
    
    if(t4 != null) begin
      t4 = null;
      $display("t4 becomes null");
    end
    
    if(t2 == null) begin
      $display("t2 is null");
    end
    else begin
      $display("t2 is not null");
    end
  end
endmodule
