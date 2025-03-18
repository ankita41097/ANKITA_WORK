class arr_dec_asc;
  rand bit[3:0] array1[];
  rand bit[3:0] array2[];
  
  function new(int size1, int size2);
    array1 = new[size1];
    array2 = new[size2];
  endfunction
  
  constraint c1 {
    foreach (array1[i]){
      if(i > 0) {
        array1[i] > array1[i-1];
      }
    }
    }
  constraint c2 {
    foreach (array2[i]){
      if(i > 0) {
        array2[i] < array2[i-1]; 
      } 
    }
    } 
endclass
        
        module test;
          initial begin
            
          
            arr_dec_asc a1;
            a1 = new(5, 7);
            if(a1.randomize()) begin
              $display("Randomized array in ascending order: %0p", a1.array1);
              $display("Randomized array in descending order: %0p", a1.array2);
            end
            else begin
              $display("Randomization failed");
            end
          end    
        endmodule
        
        