class parent_trans;
  bit [31:0] data_p = 12;
  
  function void disp_p();
    $display("parent_trans: Value of data = %0h", data_p);
  endfunction
endclass

class child_1 extends parent_trans; //p1 c1
  bit [31:0] data_c1 = 44;
  
  function void disp_c1();
    $display("child_1: Value of data = %0h", data_c1);
  endfunction
endclass

class child_2 extends parent_trans;  //p1 c2
  bit [31:0] data_c2 = 56;
  
  function void disp_c2();
    $display("child_2: Value of data = %0h", data_c2);
  endfunction
endclass

class child_A extends child_1;   //c1 cA
  bit [31:0] data_cA;
  
  function void disp_cA();
    $display("child_A: Value of data = %0h", data_cA);
  endfunction
endclass

class child_B extends child_A;  //cA cB
  bit [31:0] data_cB;
  
  function void disp_cB();
    $display("child1_2_trans: Value of data = %0h", data_cB);
  endfunction
endclass

module mult_inheritance;
  child_B cB_tr;
  child_2 c2;
  parent_trans p_tr;
  child_1 c1;
  
  initial 
    begin
   
      cB_tr = new();
      c2 = new();
      p_tr = new();
      p_tr.disp_p();
      p_tr = c2;
      p_tr.disp_p;
      c2.disp_p();
      c2 = p_tr;
      p_tr.disp_p();
      c2.disp_p();
      
      
      cB_tr.data_p = 2;
      cB_tr.data_c1 = 4;
      cB_tr.data_cA = 6;
      cB_tr.data_cB = 8;
    //cB_tr.data_c2 = 3;  // Not possible as child_B_trans is not child class of child2_trans.
      c2.data_p = 10;
      c2.disp_p();
      
      cB_tr.disp_p();
      cB_tr.disp_c1();
      cB_tr.disp_cA();
      cB_tr.disp_cB();
  end
endmodule