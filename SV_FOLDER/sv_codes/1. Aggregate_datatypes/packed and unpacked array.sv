module test;
  logic [0:1][0:2]a;
  
  initial
    begin
      a = $random;
      $display("value of a = %b", a);
      $display(a[0][1]);
      $display(a[1][0]);
      $display(a[1][2]);
      //$display("value of a = %p", a);
    end
endmodule

module test1;
  logic [0:3][0:2]a[0:1][0:2];
  initial
    begin
     
      a[0] = '{'hdef, $random, $random};
      a[1] = '{$random, $random, $random};
      
      $display("4d - array = %p", a);
      $display("array element of a[0] = %p", a[0]);
      $display("array element of a[1] = %p", a[1]);
      $display("array element of a[0][1] = %h", a[0][1]);
      $display("array element of a[1][1] = %h", a[1][1]);
      //a.delete();
      //$display("elements of array = %p", a[0]);
    end
endmodule

module tb;
  bit [3:0] [7:0] data;
  
  initial
    begin
      data = 32'habcd_45de;
      $display("data_ = %0h", data);
      for(int i = 0; i < $size(data); i++) 
        begin
          $display("data[%0d] =  %b (%0h)",i, data[i], data[i]);
      	end
    end
endmodule
      
      
      
