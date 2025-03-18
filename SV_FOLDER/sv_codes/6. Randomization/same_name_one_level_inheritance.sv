//if constr names are same in both base and child class then it will override parent class constr. 

class base_A;
  rand bit [7:0] data1;
  
  constraint pc1 {data1 inside {25, [31:45]};}
endclass

class child_A extends base_A;
  rand bit [7:0] data2;
  
  constraint pc1 { data1 inside {[50:70]};}
  constraint pc2 { soft data1 inside {[20:40]};}
  constraint ch2 { data2 inside {[30:50]};} 
  
endclass

module top1;
  child_A c_h = new();
  
  initial begin
    repeat(5) begin
    if(c_h.randomize()) begin
      $display("Randomization successful -> \n val1 value: %0d", c_h.data1);
      $display("val2 value: %0d", c_h.data2);
    end
      else begin 
      $display("Randomization failed");
      end 
//     c_h.randomize();  
//     $display("Randomization successful\n value_1 value: %0d", c_h.val1);
//     $display("value_2 value: %0d", c_h.val2);
    end
  end
endmodule
  





