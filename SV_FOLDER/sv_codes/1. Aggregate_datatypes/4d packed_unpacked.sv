module test1;
  bit [0:3][0:2]a[5][4];
  int i,j,k,l;
  initial
    begin
      foreach(a[i]) begin
        foreach(a[i][j]) begin
          foreach(a[i][j][k]) begin
            foreach(a[i][j][k][l]) begin
              a[i][j][k][l] = $urandom;
            end
          end
        end
      end
     $display("a: %p", a);
    end
endmodule