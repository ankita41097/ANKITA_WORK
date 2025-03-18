creating infinite loop:
module test();
  //bit [3:0] i;
  
  initial
    begin
      for(bit i=0; i<=3; i++)     //bit - 0 or 1 //loop should go till 3 which is not possible
        begin
          $display("the value of b is %0d",i);
        end
    end
endmodule


module infinite_loop;
  bit[3:0] a;
  initial begin
    
    for(a = 0; a < 16; a++) begin
      $display("value of a:%0d", a);
      if(a == 15) begin //loop breaking condition
        break; 
      end
    end
    
  end
endmodule
