module addr_aligned;
  logic [31:0] addr;
  logic clk, reset;

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    #20 reset = 0;
  end

  //  Check if the 32-bit address is 4K aligned
  property addr_4K_boundary;
    @(posedge clk) disable iff(reset)
    (addr[11:0] == 12'b0);  // Lower 12 bits must be zero
  endproperty
  assrt1: assert property(addr_4K_boundary)
    $info("pass: Address is 4K aligned");
  else
    $error("fail: Address is NOT 4K aligned");

  //  Check if the 32-bit address is 16-bit aligned
  property addr_16bit_aligned;
    @(posedge clk) disable iff(reset)
    (addr[0] == 1'b0);  // Lower 4 bits must be zero
  endproperty
  assrt2: assert property(addr_16bit_aligned)
    $info("pass: Address is 16-bit aligned");
  else
    $error("fail: Address is NOT 16-bit aligned");

  //  Check if the 32-bit address is 32-bit aligned
  property addr_32bit_aligned;
    @(posedge clk) disable iff(reset)
    (addr[1:0] == 2'b0);  // Lower 5 bits must be zero 
  endproperty
  assrt3: assert property(addr_32bit_aligned)
    $info("pass: Address is 32-bit aligned");
  else
    $error("fail: Address is NOT 32-bit aligned");

  //  Check if the 32-bit address is 64-bit aligned
  property addr_64bit_aligned;
    @(posedge clk) disable iff(reset)
    (addr[2:0] == 3'b0);  // Lower 6 bits must be zero for 64-bit alignment
  endproperty
  assrt4: assert property(addr_64bit_aligned)
    $info("pass: Address is 64-bit aligned");
  else
    $error("fail: Address is NOT 64-bit aligned");

  //  Check if the 32-bit address is 1K aligned (1K = 0x400)
  property addr_1K_boundary;
    @(posedge clk) disable iff(reset)
    (addr[9:0] == 10'b0);  // Lower 10 bits must be zero for 1K alignment
  endproperty
  assrt5: assert property(addr_1K_boundary)
    $info("pass: Address is 1K aligned");
  else
    $error("fail: Address is NOT 1K aligned");

  initial begin
//     repeat (10) begin 
    #10; 
    addr = 1431633920;
    #10;
    addr = 3747080336;
//     std::randomize(addr) with {addr == 1431633920;}; 
//     $display("Address: %b", addr);  
//     std::randomize(addr) with {addr == 3747080336;};  
//     $display("Address: %b", addr);
//     end
  end

    initial begin
    $display("Turning OFF all assertions");
    $assertoff();
    #20 $display("Turning ON all assertions");
    $asserton();
    end
          
    initial begin 
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
    end
endmodule

