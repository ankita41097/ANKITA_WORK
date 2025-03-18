module asso_1d;

  int array1 [int];
  int array2 [string]; 
  string array3 [string];
 
  initial 
    begin

      array1 = '{ 1 : 22,
                  6 : 34 };
      array2 = '{ "Ross" : 100,
                  "Joey" : 60 };
      array3 = '{ "Apples" : "Oranges",
                  "Pears"  : "44" };
      $display ("array1 = %p", array1);
      $display ("array2 = %p", array2);
      $display ("array3 = %p", array3);
    end
endmodule

module asso_2d;
  int arr1[string][string];

  initial 
    begin

      arr1["Banerjee"]["Ankita"] = 100;
      arr1["Priti"]["ankk"] = 200;  
      $display("Associative array = %p",arr1);    
    end
endmodule


module associative_3d;
    int arr[string][int][string];

    initial
      begin
        arr["ankita"][1]["Rose"] = 101;
        arr["priti"][1]["Marigold"] = 201;
        arr["sushanki"][2]["jasmine"] = 301;
        arr["rishi"][3]["lily"] = 401;
        
        foreach (arr[i, j, k]) 
          begin  
            $display("arr[%s][%0d][%s] = %0d", i,j,k, arr[i][j][k]);
          end
      end
endmodule

