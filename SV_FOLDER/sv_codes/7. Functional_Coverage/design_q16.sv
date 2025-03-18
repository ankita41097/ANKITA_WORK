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