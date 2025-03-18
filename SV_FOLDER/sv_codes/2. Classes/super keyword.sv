class parent1;
  bit [31:0] data;
  
  function void display();
     $display("Base: Value of data = %0h", data);
  endfunction
endclass

class child1 extends parent1;
  bit [31:0] data;
  
  function void display();
    super.data = $urandom%100;
    super.display();
    $display("Child: Value of data = %0h", data);
  endfunction
endclass

module super_keyword;
  initial begin
    child1 c1;
    c1 = new();
    
    c1.data = 5;
    c1.display();
  end
endmodule

class parent_trans;
  bit [31:0] data;
  
  function new(bit [31:0] data);
    this.data = data;
    $display("Base: Value of data = %0h", data);
  endfunction
endclass

class child_trans extends parent_trans;
  bit [31:0] data;
  
  function new(bit [31:0] data_p, data_c);
    super.new(data_p);
    this.data = data_c;
    $display("Child: Value of data = %0h", data);
  endfunction

endclass

module super_eg;
  initial begin
    child_trans c_tr;
    c_tr = new(5, 7);
  end
endmodule