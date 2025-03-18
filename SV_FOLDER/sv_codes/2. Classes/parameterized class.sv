class packet #(parameter WIDTH = 2, type D1 = bit[2:0]);
  bit [WIDTH-1:0] data;   //2bit
  D1 id;     //3bit
  
  function void display();
    $display("data = %0d, id = %0d", data, id);
  endfunction
endclass

module param_class;
  packet p1;
  packet #(8,int) p2;
  
  initial begin
    p1 = new();
    p2 = new();
    
    p1.data = 3;
    p1.id = 5;
    p1.display();
    
    p2.data = 30;
    p2.id = 19;
    p2.display();
  end
endmodule