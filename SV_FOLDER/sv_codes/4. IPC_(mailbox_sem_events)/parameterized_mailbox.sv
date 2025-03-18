module mailbox_parameterized;

  parameter type T = int; 
  mailbox #(T) mbx;       

  task t1(int num);
    T data;  //int type
    for (bit[3:0] i = 0; i < num; i++) begin
//       data = i * 10;
      data = T'(i * 10); //type casting int'(i*10)
      $display("[%0t] t1: Sending data = %0d", $time, data);
      mbx.put(data); 
      //#5; 
    end
  endtask

  task t2(int num);
    T data;
    for (int i = 0; i < num; i++) begin
      mbx.get(data); 
      $display("[%0t] t2: Received data = %0d", $time, data); 
    end
  endtask

  initial begin
    //int num = 5;
    mbx = new();
    $display("[%0t] Mailbox initialized.", $time);
    fork
      t1(5);
      t2(5);
//       t1(num); 
//       t2(num); 
    join
    $display("[%0t] Simulation complete.", $time);
    $finish;
  end
endmodule

module mailbox_parametized1();
  mailbox #(string) mb = new(3);
  
  task process_A();
    string name;
    name = "Alex";
    mb.put(name);
    $display("Sending data -> name = %s", name);
    name = "Robin";
    mb.put(name);
    $display("Sending data -> name = %s", name);
  endtask

  task process_B();
    string name;
    mb.get(name);
    $display("Receieved data -> name = %s", name);
    mb.get(name);
    $display("Receieved data -> name = %s", name);
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule