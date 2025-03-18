module coverage_test;
  bit clk = 0;
  enum {reset, mu, md, dc_idle, do_idle, dd_setter, ud_setter} state;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    option.at_least = 1;
    option.weight = 1;
    option.auto_bin_max = 2;
    option.goal = 100;
    option.name = "coverage_fsm";
    
    cp1: coverpoint state {
      bins a1 = (reset =>[*1:10] reset);   //give some time to be on that particulr state
      bins a2 = (reset => dc_idle => dc_idle);
      bins a3 = (reset => dc_idle => mu => mu);
      bins a4 = (reset => dc_idle => mu => dc_idle);
      bins a5 = (reset => dc_idle => mu => do_idle => dc_idle);
      bins a6 = (reset => dc_idle => md => md);
      bins a7 = (reset => dc_idle => md => do_idle => dc_idle);
      bins a8 = (reset => dc_idle => md => dc_idle);
      bins a9 = (reset => dc_idle => dd_setter => do_idle => dc_idle);
      bins a10 = (reset => dc_idle => dd_setter => dc_idle);
      bins a11 = (reset => dc_idle => ud_setter => do_idle => dc_idle);
      bins a12 = (reset => dc_idle => ud_setter => dc_idle);
    }
  endgroup
  
  cg c1 = new();
  
  initial begin
  forever #2 clk =~ clk;
  end
  
  initial begin
    
    state = reset;
    @(negedge clk) state = dc_idle; @(negedge clk) state = mu; 
    @(negedge clk) state = mu; 		@(negedge clk);
    
    $display("Total Coverage Report: %0.2f%%", c1.get_coverage());
    $display("Total coverage for coverpoint: %0.2f%%", c1.cp1.get_coverage());
    $finish();
  end
endmodule
    
    
      
      