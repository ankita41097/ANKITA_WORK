module mailbox_gen_bounded();
  mailbox mb = new(1); //bounded
  
  task process_A();
    int data;
    string name;
//     repeat(3) begin
    data = $urandom_range(1,30);
    #1;
	mb.put(data);
    $display("[%0t] Put data = %0d, size = %0d",$time, data, mb.num());
    //#1;
    name = "SystemVerilog";
    mb.put(name);
    $display("[%0t] Put name = %0s, size = %0d",$time, name, mb.num());
//     end
  endtask

  task process_B();
    int data;
    string name;
//     repeat(3) begin  
    mb.get(data);
    $display("[%0t] Got data = %0d, size =%0d",$time, data, mb.num());
    mb.get(name);
    $display("[%0t] Got name = %0s, size = %0d",$time, name, mb.num());
//     end
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule


module mailbox_unbounded();
  mailbox mb = new(); //unbounded
  
  task process_A();
    int data;
    int id;
    repeat(5) begin
      data = $urandom_range(1,100);
      mb.put(data);
      $display("[%0d] Put data = %0d, size = %0d",$time, data, mb.num());
      id = $urandom%45; 
      mb.put(id);
      $display("[%0d] Put id = %0d, size = %0d",$time, id, mb.num());
    end
    $display("-------------------------------------------------");
  endtask

  task process_B();
    int data;
    int id;
    repeat(5) begin
      mb.get(data);
      $display("[%0t] got data = %0d, size = %0d", $time, data, mb.num());
      mb.get(id);
      $display("[%0t] got id: %0d, size = %0d",$time, id, mb.num());
    end
  endtask
  
  initial begin
    fork
      #1 process_A();
      #2 process_B();
    join
  end
endmodule


