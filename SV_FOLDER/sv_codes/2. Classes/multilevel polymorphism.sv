class parent;
  bit [31:0] data;
  int id;
  
  virtual function void display();
     $display("Base: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_A extends parent;
  function void display();
    $display("Child_A: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_B extends parent;
  function void display();
    $display("Child_B: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_C extends parent;
  function void display();
    $display("Child_C: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

module class_example;
  initial begin
    parent p_A = new();
//     parent p_B, p_C;
    child_A c_A = new();
    child_B c_B = new();
    child_C c_C = new();
    
    p_A.data = 100;
    p_A.id = 1;
    p_A.display();   //display base class display function
    //c_B.display();
    
    p_A = c_A;   //p=c
    c_A.data = 50;
    c_A.id = 6;
    p_A.display();   ///base class values are overridden by its child class
    c_A.display();
    
    p_A = c_B;
    c_B.data = 100;    
    c_B.id   = 1;
    p_A.display();    //override base class values
    c_B.display();
    
    p_A = c_A;
    c_C.data = 400;
    c_C.id   = 4;
    p_A.display();   //display child c display  
    c_C.display();   

  end
endmodule