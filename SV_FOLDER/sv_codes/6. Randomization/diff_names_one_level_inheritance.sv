//if constr names are diff then it will check for eithr conflict or overlapped
class parent_A;
  rand bit [7:0] val1;
  
  constraint pc1 {val1 inside {5, [10:15]};}
endclass

class child_C extends parent_A;
  rand bit [7:0] val2;
  
  //   constraint ch1 { val1 inside {[20:40]};}  //constraint conflict
  constraint ch3 { val1 inside {[5:10]};}
  constraint ch2 { val2 inside {[30:50]};} 
  
endclass

module top1;
  child_C c_h = new();
  
  initial begin
//     repeat(5) begin
    if(c_h.randomize()) begin
      $display("Randomization successful -> \n val1 value: %0d", c_h.val1);
      $display("val2 value: %0d", c_h.val2);
    end
      else begin 
      $display("Randomization failed");
      end 
//     c_h.randomize();  
//     $display("Randomization successful\n value_1 value: %0d", c_h.val1);
//     $display("value_2 value: %0d", c_h.val2);
//     end
  end
endmodule







