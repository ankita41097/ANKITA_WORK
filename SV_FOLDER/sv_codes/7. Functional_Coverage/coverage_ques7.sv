class coverage_test;
  rand bit [9:0] opcode;  //10-bit, 0-1023

  covergroup cg;
    option.per_instance = 1;
    option.goal = 100;       
    option.at_least = 1;  
    
    cp1: coverpoint opcode {
      bins a1 = {[0:15]};                // 0 to 15
      bins a2 = {[960:1023]};           //  960 to 1023
      ignore_bins a3 = {[100:200]};    // 100-200 
      illegal_bins a4 = {[500:600]};   //500-600
      wildcard bins a5 = {10'b101XXXXX0};
    }
  endgroup

  function new();
    cg = new();
  endfunction
endclass

module tb;
  coverage_test cov;

  initial begin
    cov = new();
    
    repeat(50) begin
      cov.opcode = $random;
      cov.cg.sample();
      $display("Opcode value : %0d", cov.opcode);
    end
    
    $display("Coverage: %0.2f%%",cov.cg.get_coverage());
    $display("Hit count for a1: %0d",cov.cg.cp1.get_hitcount("a1"));
    $display("Hit count for a2: %0d",cov.cg.cp1.get_hitcount("a2"));
//     $display("Hit count for ignore bins: %0d",cov.cg.cp1.get_hitcount("a3"));
    $display("Hit count for illegal bins: %0d",cov.cg.cp1.get_hitcount("a4"));
    $display("Hit count for wildcard bins: %0d",cov.cg.cp1.get_hitcount("a5"));
  end
endmodule

      
      
