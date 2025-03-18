class transaction;
  bit[31:0] data;
  int id;
  
  function new(bit [31:0]data, int id);
    this.data = data;
    this.id =id;
  endfunction
  
  function void display();
    $display("Data: %0d, Id: %0d", data, id);
  endfunction
endclass

class transaction1 extends transaction;
  bit[31:0] data;
  int id;
  //transaction t1 = new();

  function new();
    this.this.data = data;
    this.this.id = id;
  endfunction
  
  function void display();
    $display("Data: %0d, Id: %0d", data, id);
  endfunction  
endclass

module test;
  transaction1 t1, t2;
  
  initial begin
    t1 = new(5,3);
    t1.display();
    t2 = new(8,4);
    t2.display();
    
    
    //t2= new(7,9);
    //t2.t1.display();
  end
endmodule
    

  
    
  