// Code your testbench here
// or browse Examples
module abc;
  int a[][int][$];
  int rm[][];
  int siz;
  
  
  initial
    begin
      a=new[3];
      a[2][1]='{70,71,72};
      a[2][3]='{90,91,92,93};
      a[0][0].push_back(31);
      a[0][1].push_back(32);
      a[0][1].push_back(37);
      a[0][2].push_back(33);
      a[0][3].push_back(34);
      a[1][0].push_back(41);
//       a[1][1].push_back(42);
//       a[1][2].push_back(43);
//       a[1][3].push_back(44);
//       a[2][0].push_back(51);
//       a[2][1].push_back(52);
//       a[2][2].push_back(53);
//       a[2][3].push_back(54);

      $display("print 3d array a=%p",a);
      $display("print 3d array a[0][0][0]=%0d",a[0][0][0]);
      $display("print 3d array a[0][1][1]=%0d",a[0][1][1]);
      $display("print 3d array a[0][3][2]=%0d",a[0][3][2]);
      siz=a[2][3].size();
      $display("size of an 3d array=%d",siz);
      //removing array
      a[2][3].pop_back();
     // $display("rm of an array=%p",rm);
      $display("print rm array a=%p",a);
      
      a[2][3].shuffle;
      $display("shuffled array a=%p",a);
      a[0][1].insert(1,99);
      $display("inserted array a=%p",a);
      a.delete();
      $display("deleted array a=%p",a);
    end
  
  
  
endmodule