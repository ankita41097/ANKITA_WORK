//Transaction class "packet"
class packet;
  rand bit [7:0] addr;
  rand bit [7:0] data;

  //Displaying randomized values
  function void post_randomize();
    $display("Packet -> Packet Generated");
    $display("Packet -> Addr = %0d,Data = %0d",addr,data);
  endfunction
endclass

//Generator - Generates the transaction packet and send to driver
class generator;
  packet pkt;
  mailbox mbx_gen;
  
  //getting mailbox handle
  function new(mailbox mbx_gen);
  mbx_gen = new();
    this.mbx_gen = mbx_gen;
  endfunction
  
  task start;
    repeat(2) begin
      pkt = new();
      pkt.randomize(); //generating packet
      mbx_gen.put(pkt);  //putting packet into mailbox
      $display("Generator -> Packet Put into Mailbox");
      #5;
    end
  endtask
endclass

// Driver - Gets the packet from generator and display's the packet items
class driver;
  packet pkt;
  mailbox mbx;

  //constructor, getting mailbox handle
  function new(mailbox mbx);
    mbx = new();
    this.mbx = mbx;
  endfunction

  task start;
    repeat(2) begin
      mbx.get(pkt); //getting packet from mailbox
      $display("Driver -> Packet Recived");
      $display("Driver -> Addr = %0d,Data = %0d\n",pkt.addr,pkt.data);
    end
  endtask
endclass


//top_testbench 
module top_tb;
  generator gen;
  driver drv;
  mailbox mb; //declaring mailbox mb

  initial begin
    //Creating the mailbox, Passing the same handle to generator and driver, 
    //because same mailbox should be shared in-order to communicate.
    
    mb = new(); //creating mailbox

    gen = new(mb); //creating generator and passing mailbox handle
    drv = new(mb); //creating driver and passing mailbox handle
    $display("------------------------------------------");
    fork
      gen.start();
      drv.start(); 
    join
    $display("------------------------------------------");
  end
endmodule