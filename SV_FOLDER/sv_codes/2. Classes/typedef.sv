typedef class packet_2;

class packet_1;
  int data;
  int id;
  packet_2 pkt2 = new();
      
  function void display();
    $display("Packet_1: data = %0d and id = %0d", data, id);
    $display("Pcket_2: addr = %0d", pkt2.addr);
  endfunction
endclass

class packet_2;
  int addr = $urandom_range(200,400);
endclass

module typedef_eg;
  packet_1 pkt1;
  
  initial begin
    pkt1 = new();
    
    pkt1.data = 100;
    pkt1.id = 30;
    pkt1.display();
  end
endmodule
