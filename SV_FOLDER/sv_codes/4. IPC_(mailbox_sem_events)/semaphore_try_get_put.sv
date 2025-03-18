module semaphore_3();
  semaphore sem = new(2);
  
  task process_A();
    if(sem.try_get()) 
      $display("[%0t] process_A: Key received",$time);
    else 
      $display("[%0t] process_A: Key is not available",$time);
    $display("[%0t] process_A started",$time);
    #5;
    $display("[%0t] process_A completed",$time);
    sem.put();
  endtask
  
  task process_B();
    if(sem.try_get()) 
      $display("[%0t] process_B: Key received",$time);
    else 
      $display("[%0t] process_B: Key is not available",$time);
    $display("[%0t] process_B started",$time);
    #4;
    $display("[%0t] process_B completed",$time);
    sem.put();
  endtask
  
  task process_C();
    if(sem.try_get()) 
      $display("[%0t] process_C: Key received",$time);
    else 
      $display("[%0t] process_C: Key is not available",$time);
    $display("[%0t] process_C started",$time);
    #5;
    $display("[%0t] process_C completed",$time);
    sem.put();
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
    join
    
    $display(" 1ST FORK JOIN COMPLETED, STARTING 2ND FORK JOIN");
    
    fork
      process_A();
      process_B();
      process_C();
    join
  end
endmodule

module semaphore_4();
  semaphore sem = new();
  
  task process();
    sem.put(1);
    $display("[%0t] process is started",$time);
    #5;
    $display("[%0t] process is completed",$time);
    sem.get();
    //$display("no of keys available in sem: %0d",sem.num());
  endtask

  initial begin
    process();
  end
endmodule

module semaphore_eg;
  semaphore sem = new(1);
  
  task process_1();
    $display("[%0t] Process-1: Waiting for keys", $time);
    sem.get(1);
    $display("[%0t] Process-1: Getting keys!", $time);
    #10 $display("[%0t] Process -1: Putting keys!", $time);
    sem.put(2);
  endtask

  task process_2();
    $display("[%0t] process-1: Trying to get key", $time);
    if (sem.try_get(1))
      $display("[%0t] processs-1: successfullly got key", $time);  
    else
      $display("[%0t] process-1: key is not available", $time);
    $display("[%0t] process-1: started",$time);
    #5 $display("[%0t] process-1: completed after some delays", $time);  
    sem.put(1);
  endtask
  
   initial begin  
      fork
        process_1();
        process_2();
      join
    end
endmodule