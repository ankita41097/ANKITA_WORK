class packet;
  rand int addr;
  
  constraint addr_c1 {addr > 32'h0000_0000; addr < 32'h002f_ffff;}
  
endclass

module top;
  packet pkt;
  initial begin
    pkt = new();
    repeat(10) begin
      pkt.randomize();
      $display("address value: %h", pkt.addr);
    end
  end
endmodule

************************************************************************************************

