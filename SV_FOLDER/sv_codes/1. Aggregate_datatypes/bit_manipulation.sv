//Assignment 1
module abc;
  //logic a[7:0];
  int b;
  //int j;
   function int bit_man(input int x, input int y);
      x = x ^ (1 << y);
      return x;
    endfunction
  initial begin
    //a = 8'b00001111;
    b = 32'b0011_1100_1010_0101_1100_1010_1111_0000;
    
//     if(b[j] == 0)
//       begin
//         b[j] = 1;
//       end
//     else begin
//       b[j] = 0;
//     end
    
    
    
    
//     for(int i=0; i<=31; i++)
//       begin
//         b = b ^ (1<<i);
//       end
    //a[5] = 1;
    //b[5] = 1;
    b=bit_man(b,3);
    b=bit_man(b,1);
    $display( "b = %b",b);
    $display( "b = %b",b[3]);
  end
endmodule


/*
//Assignment 2
int a;
module test;
  a = 100;
  initial begin
    display("a = %d",$unit::a);
  end
endmodule
*/

/*
//Assignment 3
module abc;
  logic [15:0] a;
  
  initial
    begin
      a = '1;
      $display("a=%b",a);
    end
endmodule
*/

//Assignment-4
//SCOPE AND LIFTTIME 

// module pkt;
//   int i;		//global variable //scope
//   int a;
//   int j;
  
//   initial
//     begin
//       for(int i=0; i<10; i++) begin
//         int b;
//           b = b+i;
//         if(b==i)
//           begin
//             int a;
//             $display("a = %d",a);
//           end
//         $display("i = %d, b = %d", i,b,a);
//       end
//   	begin
//       for(int j=0; j<10; j++) begin
//         int a;
//           a = a-j;
//       $display("a = %d, j = %d", a,j);
//     end
//     end
//     end
//       //$display("i = %d",i);
// endmodule

    
  
  