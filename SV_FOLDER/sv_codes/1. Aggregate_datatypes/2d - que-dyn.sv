module mult_dim;
  logic[0:4]a[$][];
  int k;
   initial
     begin
       for(int i=0; i<5; i++)  //0-4
         begin
           a[i]=new[3];         //create 2 locations
         end
       foreach(a[i,j])
         begin
           a[i][j]=$random;
         end
       k=a[0].size();
       $display("array is : %p \n and size is : %0d",a,k);
       foreach(a[i])
         begin
           $display("each array is a[%0d]: %p",i,a[i]);
         end
        a[1].delete();
       $display("%p",a);
       a.push_front('{12, 15});
       $display("array: %p",a);
     end
endmodule