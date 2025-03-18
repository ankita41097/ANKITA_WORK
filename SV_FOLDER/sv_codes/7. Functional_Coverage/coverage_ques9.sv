class coverage_test;
  rand bit[7:0] signal; 
  
  covergroup cg(input bit[7:0] min, max, value);
    option.per_instance = 1;
    option.at_least = 1;
    option.goal = 90;
    option.auto_bin_max = 2;
    option.weight = 1;
    
    cp1: coverpoint signal {
      bins sig_range = {[min:max]};
      bins val = {value};
      ignore_bins ig_bin = {[32:63]};
//       bins illegal_bins ill_bins = {50};
      bins def_bin = default;
    }
  endgroup
  function new(input int min, max, value);
    cg  = new(min, max, value);
  endfunction
endclass

module tb;
  coverage_test cov;
  initial begin
    cov = new(1, 31, 99);
    repeat(500) begin
      cov.randomize() with {cov.signal inside {[0:100]};};
//       cov.signal = $urandom_range(0, 100);
      #5;
      $display("Signal value:%0d", cov.signal);
      //#5;
      cov.cg.sample();
    end
    
    $display("Total Coverage Report: %0.2f%%", cov.cg.get_coverage());
    $display("Coverpoint cp1: %0.2f%%", cov.cg.cp1.get_coverage());
    $display("Hit count for sig_range: %0d", cov.cg.cp1.get_hitcount("sig_range"));
    $display("Hit count for specific value: %0d", cov.cg.cp1.get_hitcount("val"));
    $display("Hit count for ignore bin: %0d", cov.cg.cp1.get_hitcount("ig_bin"));
    $display("Hit count for def_bin: %0d", cov.cg.cp1.get_hitcount("def_bin"));
  end
endmodule
      
      
    
  
 
  
  