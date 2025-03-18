module mailbox_peek();
  mailbox mb = new(3);
  
  task process_1();
    int num;
    repeat(6) begin
      num = $urandom%45;
      mb.put(num);
      $display("Sending data: %0d", num);
      #2;
    end
    $display("-------------------------------------");
  endtask
  
  task process_2();
    int num;
    mb.peek(num);
    $display("peek data: %0d", num);
    mb.peek(num);
    $display("peek data: %0d", num);
    if(mb.try_peek(num))
      $display("try peek successful -> data: %0d", num);
    else begin
      $display("Try peek failed");
    end
    $display("-------------------------------------");
    repeat(5) begin
      #1;
      mb.get(num);
      $display("Received data: %0d", num);
    end
      mb.peek(num);
      $display("peek data: %0d", num);
      
    if(mb.try_peek(num))
      $display("try peek successful -> data: %0d", num);
    else begin
      $display("Try peek failed");
    end
    if(mb.try_get(num))
      $display("data received successfully: %0d", num);
      else begin
        $display("data received failed");
      end
    if(mb.try_peek(num))
      $display("try peek successful -> data: %0d", num);
    else begin
      $display("Try peek failed");
    end
  endtask
        
  
  initial begin
    fork
      process_1();
      process_2();
    join
  end
endmodule
    
    
    
    
      