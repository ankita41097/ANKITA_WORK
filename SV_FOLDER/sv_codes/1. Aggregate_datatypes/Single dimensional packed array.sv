 module tb;
   bit [7:0] data;
   
   initial
     begin
       data = 8'hb2;
       for(int i = 0; i < $size(data); i++)
         begin
           $display("data[%0d] = %b", i, data[i]);
         end
     end
 endmodule
       
