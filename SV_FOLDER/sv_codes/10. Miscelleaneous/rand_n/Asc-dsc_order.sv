**********************Asc and Dsc Order ***************
class D_arr;
  rand bit [7:0] array[]; 

    function new(int size);
        array = new[size];
    endfunction

    constraint asc_order {
        foreach (array[i]) {
            if (i > 0) {
                array[i] > array[i-1]; // Ascending order
 //             $display("Randomized array [i]: %0d", array[i]);
            }
        }
    }
              
//               constraint dsc_order {
//         foreach (array[i]) {
//             if (i > 0) {
//               array[i] < array[i-1]; 
//             }
//         }
//     }
endclass

module tb;
    initial 
      begin
        D_arr rand_obj = new(5);

        // Randomize the dynamic array
        if (rand_obj.randomize()) 
		begin
          $display("Randomized array in ascending order: %0p", rand_obj.array);
          //$display("Randomized array in descending order: %0p", rand_obj.array);

        end else begin
            $error("Failed to randomize the array!");
        end
    end
endmodule