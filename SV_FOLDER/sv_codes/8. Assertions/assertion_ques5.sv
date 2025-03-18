module fifo_synchronous;
  logic clk, reset;
  logic wr_en, rd_en;
  logic [7:0] write_data;
  logic [7:0] read_data;
  logic[3:0] wr_ptr, rd_ptr;
  logic fifo_full, fifo_empty;
  logic [3:0] depth;
//   logic [3:0] count;
   
  initial begin
    clk = 0;  
    forever #5 clk = ~clk;  
  end
      
  initial begin
    reset = 1;
    #5 reset = 0;  
  end

  //1. fifo empty check
  property fifo_empty_check;
    @(posedge clk) disable iff(reset)
    (wr_ptr == rd_ptr) |-> (fifo_empty);
//     (fifo_empty) |-> (depth == 0);
  endproperty
  
  assert1: assert property (fifo_empty_check)
    $info("at time %t, Assertion fifo_empty passed",$realtime);
    else $error("at time %t, Assertion fifo_empty passed",$realtime);
    
    //2. fifo full check
  property fifo_full_check;
    @(posedge clk) disable iff(reset)
    (wr_ptr - rd_ptr == depth) |-> (fifo_full);
//     (fifo_full) |-> (count == 16);  
  endproperty
    
    assert2: assert property (fifo_full_check)
      $info("at time %t, Assertion fifo_full passed",$realtime);
      else $error("at time %t, Assertion fifo_full passed",$realtime);
            
      //3. no read when fifo is empty
  property fifo_empty_no_read;
    @(posedge clk) disable iff(reset)
//     !(rd_en && fifo_empty); 
    (rd_en) |-> !fifo_empty;
  endproperty
               
  assert3: assert property (fifo_empty_no_read)
    $info("at time %t, Assertion fifo_empty_no_read passed",$realtime);
    else $error("at time %t, Assertion fifo_empty_no_read passed",$realtime);
    
    //4. no write when fifo is full
  property fifo_full_no_write;
    @(posedge clk) disable iff(reset)   
//     !(wr_en && fifo_full);
    wr_en |-> !fifo_full;
  endproperty
        
  assert4: assert property (fifo_full_no_write)
    $info("at time %t, Assertion fifo_full_no_write passed",$realtime);      
    else $error("at time %t, Assertion fifo_full_no_write passed",$realtime);    
    
    //5. behavior of wr_ptr and rd_ptr
  property wr_ptr_behavior;
    @(posedge clk) disable iff(reset)
//     (wr_en || rd_en) |=> (wr_ptr < 8 && rd_ptr < 8);  
    (wr_en && !fifo_full) |-> (wr_ptr == $past(wr_ptr) + 1);
  endproperty
        
    assert5: assert property (wr_ptr_behavior)
      $info("at time %t, Assertion wr_ptr_behavior passed",$realtime);  
      else $error("at time %t, Assertion wr_ptr_behavior passed",$realtime);
    
      //6. behavior of rd_ptr
     property rd_ptr_behavior;
    @(posedge clk) disable iff(reset)
//     (wr_en || rd_en) |=> (wr_ptr < 8 && rd_ptr < 8);  
       (rd_en && !fifo_empty) |-> (rd_ptr == $past(rd_ptr) + 1);
  endproperty
        
    assert6: assert property (rd_ptr_behavior)
      $info("at time %t, Assertion rd_ptr_behavior passed",$realtime);  
      else $error("at time %t, Assertion rd_ptr_behavior passed",$realtime);
    
     //7. depth of fifo reflects the diffrence b/w wr_ptr and rd_ptr
  property fifo_depth;
    @(posedge clk) disable iff (reset) 
    (depth == ((wr_ptr >= rd_ptr) ? (wr_ptr - rd_ptr) : (8 + wr_ptr - rd_ptr)));
  endproperty
    
  assert7: assert property (fifo_depth)
    $info("at time %t, Assertion fifo_depth passed",$realtime);       
    else $error("at time %t, Assertion fifo_depth passed",$realtime);
    
    //8. behavior of reset condition
  property reset_check;
    @(posedge clk) (reset == 1) |-> (fifo_empty == 1 && !fifo_full && wr_ptr == 0 && rd_ptr == 0 && depth == 0);
  endproperty
    
  assert8: assert property (reset_check)
    $info("at time %t, Assertion fifo_depth passed",$realtime);       
    else $error("at time %t, Assertion fifo_depth passed",$realtime);
      
    initial begin
      repeat(20) begin
//         @(posedge clk)
        #20;
        std::randomize(wr_en, rd_en, wr_ptr, rd_ptr, fifo_full, fifo_empty, depth, write_data, read_data);
        #10;
        $display("wr_en:%0d, rd_en:%0d, wr_ptr:%0d, rd_ptr:%0d, read_data:%0d, write_data:%0d, full:%0d, empty:%0d, depth:%0d", wr_en, rd_en, wr_ptr, rd_ptr, read_data, write_data, fifo_full, fifo_empty, depth);
      end
    end
       
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;  
      #500 $finish;
    end   
    endmodule
   