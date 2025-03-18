module disable_fork;

  initial begin
    $display("Simulation start at time: %0t", $time);
    
    fork: A
      begin: thread_1
        $display("[%0t] Thread-1 of fork-1 Started", $time);
        #5 $display("[%0t] Thread-1 of fork-1 Finished", $time);
      end
      
      begin
      $display("[%0t] Thread-2 of fork-1 Started", $time); //thread_2
        #2;
      end
      
//    disable thread_3;      
      begin: thread_3
        $display("[%0t] Thread-3 of fork-1 Started", $time);
        disable thread_3;
        #20 $display("[%0t] Thread-3 of fork-1 Finished", $time);
      end
//      disable thread_3;
    join_any
    //disable thread_3;

    fork: B
      begin: thread_1
        $display("[%0t] Thread-1 of fork-2 Started", $time);
        #5 $display("[%0t] Thread-1 of fork-2 Finished", $time);
      end
      
      begin: thread_2
        $display("[%0t] Thread-2 of fork-2 Started", $time);
        #20 $display("[%0t] Thread-2 of fork-2 Finished", $time);
      end
      
      begin: thread_5
        $display("task started");
        disable thread_5;
        sub_process();
      end
    join_none
    
    fork: C
      begin: thread_1
        $display("[%0t] Thread-1 of fork-3 Started", $time);
        #10 $display("[%0t] Thread-1 of fork-3 Finished", $time);
      end
      
      begin: thread_2
        $display("[%0t] Thread-2 of fork-3 Started", $time);
        #30 $display("[%0t] Thread-2 of fork-3 Finished", $time);
      end
    join_none
    
    disable C;
 //   disable fork;
    
      $display("Simulation end at time: %0t", $time);
      $display("[%0t] After disable-fork", $time);
      end
      
      task sub_process();
        $display("[%0t] Sub-Process Started", $time);
        #10;
        $display("[%0t] Sub-Process Finished", $time);
      endtask   
endmodule
