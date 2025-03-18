class Thread;
  int count;
  
  function new();
    count = 0;
  endfunction

  task task1();
    for (int i = 0; i < 4; i++) begin
     #2 $display("[%0t] Task1: Iteration %0d", $time, i);
    end
  endtask

  task task2();
    for (int i = 0; i < 3; i++) begin
     #1 $display("[%0t] Task2: Iteration %0d", $time, i);
    end
  endtask
  
  function void call_task();
    fork
      task1;
      task2;
    join_none
  endfunction
endclass

module thread_test;

  initial begin
    Thread obj;
    obj = new();
    
    $display("[%0t] Simulation Start", $time);
    //fork
     obj.call_task();
//     obj.task1;
//     obj.task2;
    //join_any
    $display("[%0t] Simulation End", $time);
  end

endmodule
