class coverage_pkt;
  rand bit [3:0] a;    //4-bit 0-15
  rand byte b;         //8-bit //signed
  rand logic [4:0] c;   //5-bit 0-31
  rand logic [6:0] d;   //7-bit 0-127
  rand bit enable;
  
  covergroup cg1;
    option.per_instance = 1;
    option.at_least = 1;
    option.goal = 100;
    option.auto_bin_max = 2;
    
    cp1: coverpoint a iff(enable) {
      bins a1 = {1,3,5};
      bins a2 = {14,15};
      bins a3 = (2=>4=>6);
    }
    
    cp2: coverpoint b iff(enable) {
      bins a1 = {[0:15]};
      bins a2 = {[50:101]};
      bins a3 = (10=>50=>100);
    }
    
    cp3: coverpoint c iff(enable==0) {
      bins b1 = {0,1,3,5,7};
      bins b2 = {0,2,4,6,8,10};
      bins b3 = (5=>10=>15=>20=>25=>30);
    }
    cp4: coverpoint d iff(enable) {
      bins b1 = {[0:63]};
      bins b2 = {[64:127]};
      bins b3 = (2=>4=>8=>16=>32=>64=>127);
    }
//     cp5: coverpoint enable {
//       bins a1 = {0,1};
//     }
  endgroup
  covergroup cg2;
    option.per_instance = 1;
    option.goal = 100;
    option.at_least = 1;
    option.auto_bin_max = 1;
    
    cp1: coverpoint b iff (enable) {
      bins a1 = {[0:127]};
      bins a2 = {[128:255]};
      bins trans = (20 => 40 => 60);
    }

    cp2: coverpoint c iff (enable) {
      bins b1 = {5, 10, 15};
      bins b2 = {20, 25, 30};
      bins trans = (5 => 10 => 20);
    }

    cp3: coverpoint d iff (enable) {
      bins low = {[0:31]};
      bins high = {[96:127]};
      bins trans = (10 => 50 => 90);
    }

    cp4: coverpoint a iff (enable==0) {
      bins bin1 = {0, 1, 2};
      bins bin2 = {12, 13, 14};
      bins transitions = (3 => 6 => 9);
    }
  endgroup
  
  function new();
    cg1 = new();
    cg2 = new();
  endfunction
endclass

module tb;
  coverage_pkt cov;
  initial begin
    cov = new();
    
    repeat(100) begin
      assert(cov.randomize());
      $display("a=%0d, b=%0d, c=%0d, d=%0d, enable=%0d",cov.a, cov.b, cov.c, cov.d, cov.enable);
   
      cov.cg1.sample();
      cov.cg2.sample();
      
    end
    $display("******************************************************");
    $display("Coverage Report of Covergroup-1");
    $display("Total Coverage Report:%0.2f%",cov.cg1.get_coverage());
    $display("Instant coverage:%0.2f%",cov.cg1.get_inst_coverage());
    
    $display("Coverage report of cp1:%0.2f%",cov.cg1.cp1.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg1.cp2.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg1.cp3.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg1.cp4.get_coverage());
    
    $display("CG1 cp1.a1 count: %0d",cov.cg1.cp1.get_hitcount("a1"));
    $display("CG1 cp1.a2 count: %0d",cov.cg1.cp1.get_hitcount("a2"));
    $display("CG1 cp1.a3 hit count:%0d",cov.cg1.cp1.get_hitcount("a3"));
    
    $display("*********************************************************");
    
    $display("Coverage Report of Covergroup-2");
    $display("Total Coverage Report:%0.2f%",cov.cg2.get_coverage());
    $display("Instant coverage:%0.2f%",cov.cg2.get_inst_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg2.cp1.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg2.cp2.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg2.cp3.get_coverage());
    $display("Coverage report of cp1:%0.2f%",cov.cg2.cp4.get_coverage());
    
    $display("CG2 cp1.a1 count: %0d", cov.cg2.cp1.get_hitcount("a1"));
    $display("CG2 cp1.a2 hit count: %0d", cov.cg2.cp1.get_hitcount("a2"));
    $display("CG2 cp1.trans hit count: %0d", 
             cov.cg2.cp1.get_hitcount("trans"));
    $finish;
  end
endmodule
  

    
    
    
      
  
  