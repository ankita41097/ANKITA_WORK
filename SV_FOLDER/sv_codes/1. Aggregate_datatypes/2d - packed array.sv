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