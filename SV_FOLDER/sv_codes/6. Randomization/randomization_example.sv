class rand_vars;
  
  rand bit [7:0] val_1;
  rand bit [7:0] val_2;
  rand bit en;
  rand bit [7:0] val_3;
  rand bit [7:0] val_4;
  rand bit [7:0] val_5;
  rand bit [7:0] val_6;
  rand bit [4:0] val_7;
  rand bit [1:0] val_8;
  rand bit [2:0] len;
  rand bit[3:0] array[];
  
  constraint s1 {array.size inside {[0:10]};}
  constraint c1 {val_1 inside {[10:20]};}
  constraint c2 {soft val_2 inside {40,70,80};}
  constraint c3 { solve en before val_3;
                 if(en == 1) val_3 inside {[40:50]};}
  constraint c4 {val_4 dist {[20:25] := 2};}     //25-35 = 5(each)
  constraint c5 {val_5 dist {[70:90] :/ 10};}  //20/10 = 2(each)
  constraint c6 {unique {val_6};}
  constraint c7 {val_7 == 10 -> val_2 < 20;}
  constraint c8 {if(val_8 == 2){
    				len < 2};  //0,1 
                 else{   
                    len > 4;}} //5,6,7
                  
  constraint c9 {foreach (array[i]) 
    array[i] == i;}
endclass

module top;
  rand_vars r1;
  initial begin
    r1 = new();
    
    repeat(5) begin
    r1.randomize();
      $display("val_1 = %0d, val_2 = %0d, en = %0d, val_3 = %0d, val_4 = %0d, val_5 = %0d, val_6 = %0d, val_7 = %0d, val_8 = %0d, len = %0d, array = %0p", r1.val_1, r1.val_2, r1.en, r1.val_3, r1.val_4, r1.val_5, r1.val_6, r1.val_7, r1.val_8, r1.len, r1.array);
    end
  end
endmodule
