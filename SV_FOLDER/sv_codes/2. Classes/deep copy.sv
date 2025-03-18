class parity_calc;		//sub class
  bit [7:0] parity = 10;
  bit [2:0] a;
  
  //custom copy method to perform deep copy
  function parity_calc copy();
    copy = new();
    copy.parity = this.parity; //copy all the properties into copy object
  endfunction
endclass
  
class packet;		//main class
  bit [7:0] header = 15;
  bit [7:0] data = 50;
  parity_calc par_h = new();
  
  //custom copy method to perform deep copy
  function packet copy();
    copy = new();
    copy.header = this.header;
    copy.data = this.data;
    copy.par_h = this.par_h.copy();
  endfunction
endclass

module deep_copy;
  packet pkt1;
  packet pkt2;
  initial begin
    pkt1 = new();
    
    //perform deep copy by calling parent class copy method
    pkt2 = pkt1.copy();
    $display("checking values of pkt 1 and pkt 2: %0p and %0p", pkt1,pkt2);
    $display("\nPerforming deep copy");
    $display("pkt1 after deep copy {Header=%d,Data=%d,Parity=%d}", pkt1.header, pkt1.data, pkt1.par_h.parity);
    $display("pkt2 after deep copy {Header=%d,Data=%d,Parity=%d}", pkt2.header, pkt2.data, pkt2.par_h.parity);
    
    pkt2.par_h.parity = 40;
    $display("\nCHANGING THE VALUE OF PKT2 PARITY-->NOTE: pkt1 parity is not changed since both pkt1 and pkt2 parity are now pointing to different parity object");
    $display("pkt1 after updating parity = %d",pkt1.par_h.parity);
    $display("pkt2 after updating parity = %d",pkt2.par_h.parity);
  end
endmodule