class packet;
  local bit [31:0] data;
  protected int id;
  
  function new();
    data = 103;     //access within the scope of class
    id = 14;
  endfunction
  
  protected function void display();
    $display("data = %0d and id = %0h", data, id);
  endfunction
endclass

  class child_pkt extends packet;
    local bit [31:0] addr;
    
    function new();
      addr = $urandom_range(100,500);
      id = $urandom_range(50,100);  //protected vars and methods can be accessed in child clss but not local vars
      display();
    endfunction
endclass

module data_hiding;
  packet pkt;
  child_pkt c_pkt;
  
  initial begin
    pkt = new();
    c_pkt = new();
    
    $display("packet: %0p", pkt);
    $display("child packet: %0p", c_pkt);
    
    //pkt.data = 100;
    //pkt.id = 1;
    //pkt.display();
  end
endmodule
