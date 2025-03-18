class packet;
  rand bit[31:0] addr;
  constraint c1 {addr[31:12] == 0;} //4k = 2^12 -> 32-12 = 0, 12-bits
endclass

module top;
  packet pkt;
  initial begin
    pkt = new();
    repeat(5) begin
      pkt.randomize();
      $display("address value = %0b", pkt.addr);
    end
    $display("**************************************");
  end
endmodule

class packet_1;
  rand bit[31:0] addr;
  constraint c1 {addr[31:10] == 0;}  //1k = 2^10 -> 32-10 = 0, 10-bits
endclass

module top_1;
  packet_1 pkt;
  initial begin
    pkt = new();
    repeat(5) begin
      pkt.randomize();
      $display("addr value = %0b", pkt.addr); 
    end
  end    
endmodule

  
