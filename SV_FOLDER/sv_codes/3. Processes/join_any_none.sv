module fork_join1;
  //int i;
  initial begin
    int i;
   
    $display("Simulation start at time: %0t",$time);
    fork
      for(i=0; i<4; i++)
        begin: thread_1    
          #2 $display("Time[%0t] Thread[%0d] started i=%0d",$time, i, i);
        end
    join
  $display("Simulation end at time: %0t", $time);
  end
endmodule

///////////////////////////////////////////////////////////////////////////////

module fork_join_any1;

  initial begin
    int i;

    $display("[%0t] Simulation Start", $time);

    fork
      for (i = 0; i < 4; i++) begin: thread_1
        #1 $display("[%0t] join_any thread 1: i = %0d", $time, i);
      end
      for(int j = 0; j < 2; j++) begin: thread_2
        #1 $display("[%0t] join_any thread 2: i = %0d", $time, j);
      end
    //join_any
    join_none

    $display("[%0t] Parent block continues after join_any", $time);

    #5;
    $display("[%0t] Simulation End", $time);
  end
endmodule

/////////////////////////////////////////////////////////////////////////////
        
module fork_join_none1;

  initial begin
    int i;

    $display("Simulation Start at Time %0t", $time);
    fork
      for (i = 0; i < 4; i++) begin: thread_1
        $display("Time %0t: join_any thread i = %0d", $time, i);
      end
    join_any
    $display("[%0t] Parent block continues after join_any", $time);

    fork
      for (int j = 0; j < 4; j++) begin: thread_2
        $display("Time %0t: join_none thread j = %0d", $time, j);
      end
    join_none
    $display("[%0t] Parent block continues immediately after join_none", $time);

    #5 $display("[%0t] Simulation End", $time);
  end
endmodule