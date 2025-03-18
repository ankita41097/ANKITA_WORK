//interface -> class -> module

interface dff_if(input logic iclk);    //interface clk
  logic reset;
  logic din;
  logic qout;
  logic qbar;
  modport mod1(input reset, din, output qout, qbar);
endinterface


module d_ff(dff_if.mod1 cif, input logic dclk); //interface handle, dsign clk
  always_ff @(posedge dclk or posedge cif.reset) begin
    if(cif.reset)      //reset=1
      cif.qout <= 1'b0;
    else
      cif.qout <= cif.din;
  end
  assign cif.qbar = ~cif.qout;
endmodule

class dff_test;
  virtual dff_if vif;  //virtual interface to connect interfce wth class
  
  function new(virtual dff_if vif);
    this.vif = vif;
  endfunction
  
  task run_test();
    vif.reset = 1;
    vif.din = 0;
    #50;
    vif.reset = 0;
    vif.din = 1;
    #20 vif.din = 0;
    #30 vif.din = 1;
    repeat(10) begin
    @(posedge vif.iclk);
      $display("simulation time: %0d, reset: %0b, Din: %0b, Qout: %0b, Qbar: %0b ", $time, vif.reset, vif.din, vif.qout, vif.qbar);
    end
  endtask
endclass

module top;
  bit tclk = 0;
  dff_if dif_inst(tclk);
  dff_test tb;
  
  always #5 tclk = ~tclk;
  
  d_ff dut(dif_inst, tclk);
    
    initial begin
      tb = new(dif_inst);
      tb.run_test();
      $finish;
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
    