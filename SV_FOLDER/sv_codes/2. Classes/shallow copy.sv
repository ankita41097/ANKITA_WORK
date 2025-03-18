class err_trans;    //sub class
  bit[31:0] err_data;
  bit error;
  
  function new([31:0]err_data, bit error);
    this.err_data = err_data;
    this.error = error;
  endfunction
endclass

class transaction;
  bit[31:0] data;
  int id;
  err_trans err_tr;
  
  function new();
    data = 500;
    id = 35;
    err_tr = new(32'hffff_abcd, 0);   //give values to sub class handle
  endfunction
    
  function void display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: err_data = %0h, error = %0d\n", err_tr.err_data, err_tr.error);  
  endfunction    
endclass

module shallow_copy;
  transaction tr1, tr2;
  initial
    begin
      tr1 = new();
      $display("Calling display method from tr1");
      tr1.display();
      tr2 = new tr1;  //shallow copy
      $display("After shallow copy, calling display method from tr2");
      tr2.display();
      
      tr1.data = 750;
      tr1.id = 66;
      tr1.err_tr.err_data = 32'h12345;
      tr1.err_tr.error = 1;
      $display("Calling display method from tr1");
      tr1.display();
      $display("After shallow copy, calling display method from tr2");
      tr2.display();
      tr2.data = 1050;
      tr2.id = 89;
      tr2.err_tr.err_data = 32'hdeffa;
      tr2.err_tr.error = 0;
      $display("Calling display method from tr1");
      tr1.display();
      $display("After shallow copy, calling display method from tr2");
      tr2.display();
      
    end
endmodule
  
