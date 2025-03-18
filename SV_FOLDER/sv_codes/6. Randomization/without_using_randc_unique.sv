class packet;
  rand bit[7:0] data;
  
    
//   constraint c1{data inside {[10:20]};}
  
  function void pre_randomize();
    data.shuffle();
  endfunction
  
  function new();
    for(int i=0; i<10; i++)
      data[i] = i;
  endfunction
  
endclass

module top;
  packet pkt;
  initial begin
    pkt = new();
//     repeat(5) begin
      pkt.randomize();
      $display("Randomized data = %0p", pkt.data);
//     end
  end
endmodule