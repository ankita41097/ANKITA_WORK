class A;
  int x;
  
  function new();
    x = 0;
  endfunction
  
  function void display();
    $display("This is class A");
    $display("x:%0d", x);
  endfunction
endclass

class B;
  int y;
  A a1 = new();
  
  function void display();
    $display("This is class B");
    $display("y:%0d", y);
  endfunction
endclass

class C;
  string name;
  logic [7:0] data;
//   A a1 = new();
  B b1 = new();
  
  function void display();
    $display("This is class C");
    $display("name: %s, data: %0d", name, data);
  endfunction
endclass

class D;
  logic [3:0] id;
//   A a1 = new();
//   B b1 = new();
  C c1 = new();
  
  function void display();
    $display("This is class D");
    $display("ID: %0d", id);
  endfunction
endclass

module test;
//   A a1;
//   B b1;
   C c1;
  D d1;
  initial begin
    d1 = new();
    c1 = new();
    d1.id = 2;
    d1.display();
    d1.c1.name = "Ankita";
    d1.c1.data = 8'hde;
    d1.c1.display();
    d1.c1.b1.y = 50;
    d1.c1.b1.display();
    d1.c1.b1.a1.x = 100;
    d1.c1.b1.a1.display();
    c1.display();
    
//     b1.y = 10;
//     b1.display();
//     b1.a1.x = 20;
//     b1.a1.display();
  end
endmodule