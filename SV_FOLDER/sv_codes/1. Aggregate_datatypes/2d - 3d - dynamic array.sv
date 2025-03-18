module test;
  int a1[][];
  
  initial
    begin
      a1 = new[2];
      foreach (a1[i]) 
        begin
          a1[i] = new[5];
        end
      foreach (a1[i, j]) 
        begin
          //a1[i][j] = $urandom;
          a1[i][j] = 5*i + 4*j; // Assign some values to each element
          $display("a1[%0d][%0d]: %0h", i, j, a1[i][j]);
        end
      $display("2D dynamic array: %p", a1);
    end
endmodule

module test1;
  int a1[][][];
  initial
    begin
      a1=new[3];
      foreach(a1[i])
        begin
          a1[i]=new[2];
          foreach(a1[i,j])
            begin
              a1[i][j] = new[4];
            end
        end
      foreach(a1[i,j,k])
        begin
          //a1[i][j][k] = $urandom_range(10,20);
          a1[i][j][k]=10*i+10*j+k;
          $display("a1[%0d][%0d][%0d]:%0d",i,j,k,a1[i][j][k]);
        end
      $display("3D dynamic: %p", a1);
    end
endmodule