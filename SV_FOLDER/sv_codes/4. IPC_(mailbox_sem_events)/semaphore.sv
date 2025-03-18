module semaphore_1();
  semaphore sem = new(1); 
  
  task write_mem();
    sem.get(); //blocked until it gets a key
    $display("[%0t] Before writing into memory",$time);
    #5;
    $display("[%0t] Write completed into memory",$time);
    sem.put();
  endtask
  
  task read_mem();
    sem.get(); //blocked the process until it gets a key
    $display("[%0t] Before reading from memory",$time);
    #4;
    $display("[%0t] Read completed from memory",$time);
    sem.put();
  endtask

  initial begin
    fork
      write_mem();
      read_mem();
    join
  end
endmodule

module semaphore_2();
  semaphore sem = new(3);
  
  task process_A();
    sem.get(2);
    $display("[%0t] process_A started",$time);
    #5;
    $display("[%0t] process_A completed",$time);
    sem.put(2);
  endtask
  
  task process_B();
    sem.get(1);
    $display("[%0t] process_B started",$time);
    #4;
    $display("[%0t] process_B completed",$time);
    sem.put(1);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule




