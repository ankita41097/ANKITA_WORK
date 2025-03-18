module tb;
  int i;
  initial
    begin
      for (i=0; i<5; i++)
        begin
          fork
            $display("[%0t] i:%0d", $time, i);
          join_none
        end
    end
endmodule

module tb1;
  int i;
  initial
    begin
      for (i=0; i<5; i++)
        begin
          fork
           // $display("start of simulation");
            $display("[%0t] i:%0d", $time, i);
          join_any
          //$display("parent thread");
        end
    end
endmodule

module tb2;
  int i;
  initial
    begin
      for (i=0; i<5; i++)
        begin
          fork
            $display("[%0t] i:%0d", $time, i);
          join
        end
    end
endmodule