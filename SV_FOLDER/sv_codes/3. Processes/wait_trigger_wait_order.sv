module tb;
  event e1, e2, e3;
  
  initial begin: trigger_event
    #20 -> e1;
    $display ("[%0t] Thread1: triggered e1", $time);
    #30 -> e2;
    $display ("[%0t] Thread1: triggered e2", $time);
    #40 -> e3;    
    $display ("[%0t] Thread1: triggered e3", $time);
  end

  initial begin: events_triggered
    $display ("[%0t] Thread2: waiting for trigger ", $time);
    #15 @(e1);
    $display ("[%0t] Thread2: received e1 trigger ", $time);
    #29 @(e2);
    $display ("[%0t] Thread2: received e2 trigger ", $time);
    #39 @(e3);
    $display ("[%0t] Thread2: received e3 trigger ", $time);
  end
  
  initial begin: event_triggered
    $display ("[%0t] Thread3: waiting for trigger ", $time);
    #20 wait(e1.triggered);
    $display ("[%0t] Thread3: received e1 trigger", $time);
    #30 wait(e2.triggered);
    $display ("[%0t] Thread3: received e2 trigger", $time);
    #40 wait(e3.triggered);
    $display ("[%0t] Thread3: received e3 trigger", $time);
  end
  
  initial begin: wait_order_threads
    wait_order (e1, e2, e3)
    	$display ("Events were executed in the correct order");
    else
      	$display ("Events were NOT executed in the correct order !");
  end
endmodule