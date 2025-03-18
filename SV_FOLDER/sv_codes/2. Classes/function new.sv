class constr_op1;  
  int val1, val2;
  
  function new();
    val1 = 0;
    val2 = 0;
  endfunction
    
  function void set_values(int a, int b);
    val1 = a;
    val2 = b;
  endfunction
    
  function int add();
    return val1 + val2;
  endfunction
    
  function int sub();
    return val1 - val2;
  endfunction  
endclass

class constr_op2;
  int num1, num2;
  
  function new(int a, int b);
    num1 = a;
    num2 = b;
  endfunction
  
  function int multiply();
    return num1 * num2;        
  endfunction

  function real divide();
    if (num2 != 0)
      return num1 / num2;
    else begin
      $display("Error: Division by zero.");
      return 0.0;        
    end
  endfunction
endclass
  
module constr_eg;
  
  initial begin
    constr_op1 op_h1;
    constr_op2 op_h2;
    op_h1 = new();
    op_h1.set_values(50, 25);
    $display("val1:%0d, val2:%0d", op_h1.val1, op_h1.val2);
    $display("addition: %0d", op_h1.add());
    $display("subtraction: %0d", op_h1.sub());
    op_h2 = new(50, 25);
    $display("num1:%0d, num2:%0d", op_h2.num1, op_h2.num2);
    $display("Multiplication: %0d", op_h2.multiply());
    $display("Division: %0d", op_h2.divide());
    
  end
endmodule
      
