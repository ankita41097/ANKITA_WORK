//Design 
module memory
  //#( parameter ADDR_WIDTH = 2,
     //parameter DATA_WIDTH = 8 ) 
  (
    input clk,
    input reset,  
    
    //control signals
    input [9:0]  addr,
    input         wr_en,
    input         rd_en,
    
    //data signals
    input  [31:0] wdata,
    output reg [31:0] rdata,
	output reg [1:0] err_rsp
  ); 
  
  //reg [31:0] rdata;// = 32'hFFFFFFFF;
  
  //Memory
  reg [31:0] mem [61];

  //Reset 
  always @(posedge reset) 
    begin //{
	  err_rsp = 2'b00;
      for(int i=0;i<61;i++) 
        begin //{
 	      mem[i]=32'hFFFFFFFF;
          rdata = 32'd0;
          $display("mem[%0d]=%0h,error_rsp=%0d",i,mem[i],err_rsp);
        end //}
      $display("%0t, reset happened", $time);
    end //}
  
  // Write data to Memory //Read data from memory
  always @(posedge clk && !reset)
    begin //{
      if (addr inside {[0:60],[65:1023]} && wr_en)    
        begin //{
          if(addr inside {[65:1023]})
          begin //{
	        err_rsp = 2'b01;  //decode error
            $display("decode error and error_rsp = %0d",err_rsp);
          end //}
		  else
          begin //{
            $display("%0t writing data", $time);
            mem[addr] = wdata;
			err_rsp = 2'b00;
            $display("addr =%0d, wdata = %0h, error_rsp = %0d",addr,wdata,err_rsp);
          end //}
        end //}
    end //}
   always @(posedge clk && !reset)
     begin //{
       if (addr inside {[0:60],[65:1023]} && rd_en)
        begin //{
		  if(addr inside {[65:1023]})
            begin //{
	          err_rsp = 2'b10; //slave_err
			  rdata = $urandom;
              $display("slave error and error_rsp = %0d",err_rsp);
            end //}
			else
              begin //{
              $display("%0t, reading data", $time);
              rdata = mem[addr];
			  err_rsp = 2'b00;
              $display("addr =%0d, rdata = %0h, error_rsp = %0d",addr,rdata,err_rsp);
              end //}
        end //}
     end//}
	always @(posedge clk && !reset)
      begin //{
		if(addr inside {[61:64]})
          begin //{
	      err_rsp = 2'b11; 		  //reserved error
            $display("reserved error and error_rsp = %0d,addr = %0h",err_rsp,addr);
		  if(rd_en)
            begin //{
		    rdata = 32'hDEADBEEF;
            $display("reserved error addr =%0d, rdata = %0h, error_rsp = %0d",addr,rdata,err_rsp);
            end //}
          end //}
    end //}  
endmodule

//interface

interface mem_if(input logic clk);
  logic reset;
  logic [9:0] addr;
  logic wr_en;
  logic rd_en;
  logic [31:0] wdata;
  logic [31:0] rdata;
  logic [1:0] err_rsp;
endinterface

class mem_coverage;
  rand logic [9:0] addr;  //10-bit //0-1023
  rand bit wr_en;
  rand bit rd_en;
  rand logic [31:0] wdata;
  bit [31:0] rdata; 
  bit [1:0] err_rsp;
  
  constraint c1 {addr inside {[0:1023]};}
  constraint c2 {
    (wr_en == 1) -> (rd_en == 0);             
    (rd_en == 1) -> (wr_en == 0);
  }
  
  covergroup cg;
    option.name = "memory_coverage";
    option.per_instance = 1;
    option.at_least = 1;
    option.goal = 100;
    option.weight = 1;
    
    addr_cp: coverpoint addr {
      bins addr_valid[] = {[0:60]};
      bins addr_reserved[] = {[61:64]};
      bins addr_error[] = {[65:1023]};
    }
    we_cp: coverpoint wr_en {
      bins we[] = {0, 1};
    }
    
    rd_cp: coverpoint rd_en {
      bins re[] = {0, 1};
    }
    
    wdata_cp: coverpoint wdata {
      bins low = {[0:4095]};
      bins mid = {[4096:4194303]};
      bins high = {[4194304:4294967295]};
//       bins wdata_range = {[32'h0000_0000:32'hFFFF_FFFF]};
    }
    err_rsp_cp: coverpoint err_rsp {
      bins err_rst = {2'b00};
      bins err_dcode = {2'b01};
      bins err_slave = {2'b10};
      bins err_reserved = {2'b11};
    }
    
    rdata_cp: coverpoint rdata {
      bins invalid = {32'hDEADBEEF};
      bins valid = {[32'h0000_0000:32'hFFFF_FFFF]};
    }
    
    wr_x_rd: cross wr_en, rd_en;
    wr_x_addr: cross we_cp, addr_cp;
    rd_x_addr: cross rd_cp, addr_cp;
    addr_x_errsp_rdata: cross addr_cp, err_rsp_cp, rdata_cp {
      illegal_bins ill_comb = binsof(addr_cp.addr_reserved) && binsof(err_rsp_cp.err_reserved) && binsof(rdata_cp.invalid);
    }
  endgroup
  function new();
    cg = new();
    endfunction
  
  function void sample();
    cg.sample;
  endfunction
endclass

module tb;
  bit clk = 0;
  logic reset;
  
  mem_if intf(clk);
  mem_coverage cov;
  
  initial begin
    forever #2 clk = ~clk;
  end
  
  initial begin
    intf.reset = 1;
    #20 intf.reset = 0;
  end
  
  memory dut (.clk(intf.clk), 
              .reset(intf.reset), 
              .addr(intf.addr), 
              .wr_en(intf.wr_en), 
              .rd_en(intf.rd_en), 
              .wdata(intf.wdata), 
              .rdata(intf.rdata), 
              .err_rsp(intf.err_rsp)
             );
  
  initial begin
    cov = new();
    
    repeat(1000) begin
      cov.randomize();
      intf.addr = cov.addr;
      intf.wr_en = cov.wr_en;
      intf.rd_en = cov.rd_en;
      intf.wdata = cov.wdata;
//       intf.err_rsp = cov.err_rsp;
      @(posedge clk);
      cov.sample();
      $display("addr=%0d, we=%0d, rd=%0d, wdata=%0d, rdata=%0d",intf.addr, intf.wr_en, intf.rd_en, intf.wdata, intf.rdata);
    end
    $display("Total coverage report: %0.2f%%", cov.cg.get_coverage());
    $display("Coverage report of coverpoint addr_cp: %0.2f%%", cov.cg.addr_cp.get_coverage());
    $display("Coverage report of coverpoint wr_en: %0.2f%%", cov.cg.we_cp.get_coverage());
    $display("Coverage report of coverpoint rd_en: %0.2f%%", cov.cg.rd_cp.get_coverage());
    $display("Coverage report of coverpoint err_rsp: %0.2f%%", cov.cg.err_rsp_cp.get_coverage());
    $display("Coverage report of coverpoint wdata: %0.2f%%", cov.cg.wdata_cp.get_coverage());
    $display("Coverage report of coverpoint rdata: %0.2f%%", cov.cg.rdata_cp.get_coverage());
    $display("Coverage report of cross coverpoint wr_x_rd : %0.2f%%", cov.cg.wr_x_rd.get_coverage());
    $display("Coverage report of cross coverpoint wr_x_addr : %0.2f%%", cov.cg.wr_x_addr.get_coverage());
    $display("Coverage report of cross coverpoint rd_x_addr : %0.2f%%", cov.cg.rd_x_addr.get_coverage());
    $display("Coverage report of cross coverpoint addr_x_errsp_rdata : %0.2f%%", cov.cg.addr_x_errsp_rdata.get_coverage());
//     $display("Hit_count for illegal bins", cov.cg.addr_x_errsp_rdata.get_hitcount("ill_comb"));
    #1500;
    $finish();
  end
endmodule