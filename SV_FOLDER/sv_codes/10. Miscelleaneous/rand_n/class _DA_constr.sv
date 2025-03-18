
class DA_class;
  rand int value;

//  constraint value_c {soft value inside {[20:50]};}
  constraint value_c2 {soft value inside {[20:50]};}
  
    constraint value_c1 {
    value >= 101;
    value <= 105;
  }

  function new();
    this.value = 0;
  endfunction
endclass

class Container;
  rand int item_array[]; 
  rand int num_items;

  constraint num_items_c {
    num_items >= 4;
    num_items <= 10;
  }

  constraint array_size_c {
    item_array.size() == num_items; 
  }
//   constraint value_c1 {soft
//     item_array.value >= 100;
//     item_array.value <= 20;
//   }

  function new();
    this.num_items = 0;
  endfunction

/*  function void post_randomize();
    for (int i = 0; i < item_array.size(); i++) 
      begin
      item_array[i] = new();
      assert(item_array[i].randomize()) 
	  else 
	  $fatal("Failed to randomize item");
    end
  endfunction*/
endclass

module DA;
  initial 
  begin
    Container container = new();

    if (container.randomize()) 
      begin
      $display("Container randomization successful!");

      foreach (container.item_array[i]) 
	  begin
        $display("Item[%0d].value = %0d", i, container.item_array[i]);
      end
    end 
	else 
	begin
      $fatal("Container randomization failed!");
    end
  end
endmodule
