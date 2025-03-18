module process_test;  
  process p1, p2, p3;
  
  initial begin
    fork: A
      begin: thread1
        p1 = process::self();
        $display("[%0t] status of p1: %0s",$time, p1.status.name());
        $display("[%0t] p1 started", $time);
        #10 $display("[%0t] p1 finished", $time);
      end

      begin: thread2
        p2 = process::self();
        $display("[%0t] status of p2: %0s",$time, p2.status.name());
        $display("[%0t] p2 started", $time);
        #10 $display("[%0t] p2 finished", $time);
      end

      begin: thread3
        p3 = process::self();
        $display("[%0t] p3 started", $time);
        #10 $display("[%0t] p3 finished", $time);
      end
    join_none

    #5;
    $display("Status of p1 at time %0t: %0d (0 = finished, 1 = running, 2 = waiting)", $time, p1.status());

    p2.suspend();
    $display("Status of p2 after suspend at time %0t: %0d", $time, p2.status());

    p2.resume();
    $display("Status of p2 after resume at time %0t: %0d", $time, p2.status());

    p3.kill();
    $display("Status of p3 after kill at time %0t: %0d", $time, p3.status());
    #10;
    $display("[%0t] Simulation End", $time);
    $finish;
  end
endmodule
