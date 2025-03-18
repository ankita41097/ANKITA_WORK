module covergroup_pkt;
  bit [3:0] var1;    //0-15
  bit [4:0] var2;    //0-31
  bit clk;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    option.auto_bin_max = 2;
    option.goal = 90;
    option.at_least = 2;
    
    cp1: coverpoint var1 {
      bins a1 = {0,1,2,3};
      bins a2 = {[4:7]};
      bins a3 = {[8:13],14,15};    //3bins -> a3[0], a3[1], a3[2]
    }
    
    cp2 : coverpoint var2 {
      bins b1 = {[0:7]};         //2bins -> b1[0], b1[1]
      bins b2 = {8,9,10,11};        //1 bin
      bins b3 = {12,13,14};     // 3bins
      bins b4 = {15,31};
    }
  endgroup
  
  cg cov;
  
  always #25 clk = ~clk;
  initial begin
    clk = 0;
    cov = new();
    
    repeat(10) begin
      #25;
//       @(posedge clk);
      var1 = $urandom_range(0,15);
      var2 = $urandom_range(0,20);
      //cov.sample();
    end
    
    #50;
    $display("\nCoverage Report");
    $display("Total Coverage: %0.2f%",cov.get_coverage());
    $display("instant coverage: %0.2f",cov.get_inst_coverage());
    $display("Coverage report of var1: %0.2f%",cov.cp1.get_coverage());
    $display("Bins hit count a1: %0d",cov.cp1.get_hitcount("a1"));
    $display("Bins hit count a2: %0d",cov.cp1.get_hitcount("a2"));
    $display("Bins hit count a3: %0d",cov.cp1.get_hitcount("a3"));
    $display("Coverage report of var2: %0.2f%",cov.cp2.get_coverage());
    $display("Bins hit count b1: %0d",cov.cp2.get_hitcount("b1"));
    $display("Bins hit count b2: %0d",cov.cp2.get_hitcount("b2"));
    $display("Bins hit count b3: %0d",cov.cp2.get_hitcount("b3"));
    $finish;
  end
endmodule
    
    
    
      
    