module coverage_test;
  bit [11:0] a;               //0-4095
  
  covergroup cg;
    option.per_instance = 1;
    option.goal = 100;
    option.auto_bin_max = 2;
    option.at_least = 1;
    
    cp1: coverpoint a {
      
      bins a1 = {0};
      bins a2 = {1,2,4,7};   //1 bin
      bins a3 = {[6:10]};    //1 bin
      bins a4 = {[11:31], 32}; //2 bin
      bins a6[] = {[33:37]};
      bins a7[3] = {[40:45], 46, 47};    //3 bins
//       bins a8[] = {[258:511]};
    }
  endgroup
  
  cg c1;
  initial begin
    c1 = new();
    repeat(70) begin
      a = 0;
      a = 2;
      a = 9;
      a = 32;
      a = 35;
      a = 46;
      std::randomize(a) with {a inside {[0:50]};};
      $display("a: %0d", a);
//       a = $urandom_range(0, 50);
      c1.sample();
    end
    $display("Total Coverage report of c1: %0.2f",c1.get_coverage());  
    $display("Coverage report of c1.cp1: %0.2f",c1.cp1.get_coverage());
    $display("Bins hit a1: %0d",c1.cp1.get_hitcount("a1"));
    $display("Bins hit a2: %0d",c1.cp1.get_hitcount("a2"));
    $display("Bins hit a3: %0d",c1.cp1.get_hitcount("a3"));
    $display("Bins hit a4: %0d",c1.cp1.get_hitcount("a4"));
    $display("Bins hit a6: %0d",c1.cp1.get_hitcount("a6[33]"));
    $display("Bins hit a7: %0d",c1.cp1.get_hitcount("a7[1]")); //4times 46 
  end    
endmodule
      
      
      
      
      
      
