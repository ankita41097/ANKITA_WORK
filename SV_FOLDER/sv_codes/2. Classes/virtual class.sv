virtual class parent;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Base: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass

class child extends parent;
  function void display();
    $display("Child: Value of data = %0d and id = %0d", data, id);
  endfunction  
endclass

module abs_class;
  initial begin
    parent p1;
    child c1;
    //p1 = new();
    c1 = new();
    
    p1 = c1;
    p1.data = 50;
    p1.id = $urandom%45;
    p1.display();
  end
endmodule

virtual class base;
  bit [31:0] data;
  int id;
  
  virtual function void display();
    $display("Base: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass

class ch1 extends base;
  function void display();
    $display("Child: Value of data = %0d and id = %0d", data, id);
  endfunction  
endclass

module virt_class;
  initial begin
    base b1;
    ch1 c1;
    //p1 = new();
    c1 = new();
    
    b1 = c1;
    b1.data = 750;
    b1.id = 43;
    b1.display();
  end
endmodule


//pure virtual 

virtual class parent1;
  bit [31:0] data;
  int id;
  
  pure virtual function void display();
endclass

class child1 extends parent1;
  function void display();
    $display("Child: Value of data = %0d and id = %0d", data, id);
  endfunction  
endclass

module pure_vir_class;
  initial begin
    parent1 p1;
    child1 c1;
    //p1 = new();
    c1 = new();
    
    p1 = c1;
    p1.data = 100;
    p1.id = $urandom%20;
    p1.display();
  end
endmodule