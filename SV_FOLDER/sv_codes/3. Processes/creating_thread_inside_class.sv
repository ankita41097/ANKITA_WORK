class Thread;
  int count;
  
  function new();
    count = 0;
  endfunction

  // Task 1
  task task1();
    for (int i = 0; i < 4; i++) begin
      $display("[%0t] Task1: Iteration %0d, Count = %0d", $time, i, count++);
    end
  endtask

  // Task 2
  task task2();
    for (int i = 0; i < 3; i++) begin
      $display("[%0t] Task2: Iteration %0d, Count = %0d", $time, i, count++);
    end
  endtask
  
//   function void call_task();
//     task1;
//     task2;
//   endfunction

endclass

// Testbench to execute the class
module thread_example_tb;

  initial begin
    Thread obj;
    obj = new();
    
    $display("[%0t] Simulation Start", $time);
    fork
    //obj.call_task();
    obj.task1;
    obj.task2;
    join
    $display("[%0t] Simulation End", $time);
  end

endmodule
