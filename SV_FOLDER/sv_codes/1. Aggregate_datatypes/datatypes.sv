//Datatypes

module test;
  bit a;       //2-state - 0,1
  
  initial
    begin
      a = 1;
      $display("value of a = %b",a);
    end
endmodule

module test1;
  logic b;    //4-state - 0,1,x,z
  
  initial
    begin
      b = 1'bz;
      $display("value of b = %b", b);
    end
endmodule


module test2;
  enum {idle, busy, done} state1;
  
  initial
    begin
      state1 = idle;
      $display("State: %s", state1.name());
      
      state1 = state1.next;
      $display("State: %s", state1.name());
      $display("State: %s, state = %s", state1.first.name(), state1.last.name());
    end
endmodule

module tb_colors;
  
  typedef enum {GREEN, YELLOW, RED, BLUE} colors;

  initial begin

    colors c1;
    //c1 = YELLOW; //current value = yellow

    $display ("color first = %0d", c1.first()); // First value is GREEN = 0
    $display ("color last = %0d", c1.last()); // Last value is BLUE = 3
    $display ("color next = %0d", c1.next()); // Next value is RED = 2
    $display ("color prev = %0d", c1.prev()); // Previous value is GREEN =0
    $display ("color num = %0d", c1.num()); // Total number of enum = 4
    $display ("color name = %s" , c1.name()); // Name of the current enum
  end 
endmodule




