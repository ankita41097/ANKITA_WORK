module test;

int arr[][string];

 initial begin
   arr=new[4];
   arr[0]='{"Rose":4, "Lily":4};
   arr[1]='{"Marigold":8, "Leaves":6};
   arr[2]='{"Ankita":10, "Banerjee":9};
   arr[3]='{"WestBengal":33, "Kolkata":11};

   $display("Associative array = %p",arr);     
   $display("arr = %p",arr[0]);
   $display("arr = %p", arr[3]);

end
endmodule

