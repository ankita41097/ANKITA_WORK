class parent;
  int addr;

  function display();
    $display("Addr = %0d",addr);
  endfunction
endclass

class child1 extends parent;
  int data;

  function display();
    super.display();
    $display("Data = %0d",data);
  endfunction
endclass

module test;
  initial begin
    parent p;
    child1 c1 = new();
    child1 c2;
    
    c1.addr = 10;
    c1.data = 20;

    p = c1;         //p is pointing to child class handle c.
    //c1 = p;
    if($cast(c2,p)) begin   //with the use of $cast, type chek will occur during runtm
    $display("casting successful");
    c2.display();
  end
  else begin
    $display("casting failed");
  end
  end
  
endmodule
