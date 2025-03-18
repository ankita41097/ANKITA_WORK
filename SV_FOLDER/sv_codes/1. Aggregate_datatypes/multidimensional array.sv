module mult_dim;
  bit [7:0]arr[][][$];
  
  bit [7:0]arr1[$][$][];
 
  bit [7:0]arr2[string][][$];
 
  initial
    begin
      arr=new[3];
      foreach(arr[i])
        begin
          arr[i]=new[4];
          foreach(arr[i][j])
            begin
               for(int k=0;k<2;k++)
                 begin
                    arr[i][j].push_front(k);
                 end
            end
        end
    end

  initial
    begin
      for(int k=0;k<2;k++)
        begin
          for(int i=0;i<4;i++)
             begin
               arr1[k][i] = new[3];
               for(int j=0;j<2;j++)
                  begin
                    arr1[k][i][j]=$urandom;
                  end
            end
        end
    end
  
  initial
    begin
      arr2["apple"]=new[2];
      arr2["banana"]=new[3];
      arr2["apple"][0]='{3,4,5};
      arr2["apple"][1]='{1,2,6};
      arr2["banana"][0].push_back(32);
      arr2["banana"][1]='{12,13,14};
      arr2["banana"][1].push_back('h76);
    end
  
  initial
  begin
    $display("size = %d", arr.size());
    $display("element arr[0][1][1] = %d", arr[0][1][1]);
    $display("arr = %p",arr);
    $display("arr1 = %p",arr1);
    $display("size = %d", arr1.size());
    $display("element arr1[1][2][1] = %h", arr1[1][2][1]);
    $display("arr2 = %p",arr2);
    $display("size = %d", arr2.size());
    $display("element arr2[apple][1][2]", arr2["apple"][1][2]);
  end 
endmodule
        