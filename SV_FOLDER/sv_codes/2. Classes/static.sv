class test;
  static int a;
  const int b = 10;
  
  function new ();
    a++;
  endfunction
  
  function void disp();
    $display("b = %0d", b);
  endfunction
endclass

module pkt;
  test t1[4];
  
  initial begin
    foreach (t1[i]) 
      begin 
        t1[i] = new();
        $display("Value of a = %0d", t1[i].a);
        //t1.disp();
        
      end
  end
endmodule
