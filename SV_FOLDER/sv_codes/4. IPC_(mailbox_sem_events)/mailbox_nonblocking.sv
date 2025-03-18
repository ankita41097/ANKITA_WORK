module mailbox1;
  mailbox mb = new(4);
  
  task process_1();
    int val;
    repeat(5) begin
      val = $urandom_range(1,100);
      if(mb.try_put(val))
        $display("[%0t] data put successfully: %0d",$time, val);
      else begin
        $display("[%0t] data put failed",$time);
        $display("size of the mailbox: %0d", mb.num());
      end
    end    
  endtask
  
  task process_2();
    int val;
    repeat(5)begin
      if(mb.try_get(val))
        $display("[%0t] data received successfully: %0d",$time, val);
      else begin
        $display("[%0t] data received failed",$time);
        $display("size of the mailbox: %0d", mb.num());
      end
    end
  endtask
  
  initial
    begin
      fork
        process_1();
        process_2();
      join
    end
endmodule
        
