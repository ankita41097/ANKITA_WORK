class packet_1;
  rand bit[7:0] data[];
endclass

class packet_2;
  rand packet_1 pkt = new();
  rand int data_size;
  
  constraint c1 {data_size inside {[4:10]};}
  constraint c2 {
    pkt.data.size() == data_size;
  }
  
  function new();
   data_size = 0;
  endfunction
  
endclass

module test;
  packet_2 pkt2 = new();
  initial begin
    pkt2.randomize();
    $display("data: %0p, \ndata_size: %0d", pkt2.pkt.data, pkt2.data_size);
  end
endmodule