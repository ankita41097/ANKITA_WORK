class base_class1;  
  bit[3:0]value1 = 20;
      
  function base_class1 copy();   //custom copy method
    copy = new();  
    copy.value1 = this.value1;  
  endfunction 
endclass
  
  
class base_class2;
  bit[3:0] value2 = 40;
  base_class1 b1 = new();
    
  function base_class2 copy();
    copy = new();
    copy.value2 = this.value2;
    copy.b1 = this.b1.copy;  
  endfunction  
endclass
  
  
class base_class3;    
  bit[3:0]value3 = 60; 
  base_class2 b2 = new();
    
  function base_class3 copy();
    copy = new();
    copy.value3 = this.value3;      
    copy.b2 = this.b2.copy;
  endfunction
endclass
  
  
class base_class4;
  bit[3:0]value4 = 8;
  base_class3 b3 = new();
  
  function base_class4 copy();
    copy = new();
    copy.value4 = this.value4;
    copy.b3 = this.b3.copy;
  endfunction  
endclass

module deep_copy();
  base_class4 bc1, bc2;
  
  initial
    begin
      bc1 = new();
      bc2 = bc1.copy();
      $display("bc1.value4: %d", bc1.value4);
      $display("bc2.value4: %d", bc2.value4);
      bc1.value4=10;
      $display("bc1.valuu4: %d", bc1.value4);
      $display("bc2.valuu4: %d", bc2.value4);
      $display("base class b1: %0d",bc1.b3.b2.b1.value1);
      $display("base class b2: %0d",bc1.b3.b2.value2);
      $display("base class b3: %0d",bc1.b3.value3);
      $display("base class b4: %0d",bc1.value4);
      
    end
endmodule