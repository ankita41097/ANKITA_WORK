class first_Class;
  rand int pri_value;

  constraint pri_value_c {
    pri_value >= 10;
    pri_value <= 50;
  }
endclass

class second_Class extends first_Class;
//class second_Class;
//  rand first_Class first_Obj; 
  rand int sec_value;

  constraint sec_value_c {
    sec_value >= 100;
    sec_value <= 200;
  }

  constraint c1 {
    sec_value > pri_value;
//    sec_value > first_Obj.pri_value;
  }

//   function new();
//     first_Obj = new();
//   endfunction
endclass

module top;
  initial 
  begin
    second_Class second_Obj = new();

    if (second_Obj.randomize()) 
	begin
      $display("Randomization successful!");
      $display("Outer Value: %0d", second_Obj.sec_value);
      $display("Inner Value: %0d", second_Obj.pri_value);
    end 
	else 
	begin
      $display("Randomization failed!");
    end
  end
endmodule