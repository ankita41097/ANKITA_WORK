class coverage_test;
  rand bit [3:0] data;
  rand bit [3:0] d;
  
  covergroup cg1 with function sample(input bit[3:0] a);  //fun
    option.at_least = 1;
    cp1: coverpoint a {
      bins a1[] = {2,4};}
  endgroup
  
  function int extract_data(bit [3:0]data);
    if (data >=0 && data<=5) return 3;      // 0----5
    if(data>=6 && data<=10)  return 1;		//6---10
    if (data>=11) return 2;					//11----15
  endfunction
  
  covergroup cg2;
    cp1: coverpoint extract_data(data) {
      bins b1= {3};                                  
      bins b2={1};             
      bins b3={2};}  
  endgroup
  
  function new();
    cg1 = new();
    cg2 = new();
  endfunction
endclass

module tb;
  coverage_test cov;
  initial begin
    cov = new();
    
    repeat(50) begin
      cov.randomize();
      //cov.data = $urandom;
      cov.extract_data(cov.data); 
      cov.cg2.sample();
      cov.cg1.sample(cov.d);
      $display("data : %0d d : %0d",cov.data,cov.d);
    end
    $display("Total Coverage Report of covergroup 1: %0.2f%%", cov.cg1.get_coverage());
    $display("Total Coverage Report of covergroup 2: %0.2f%%", cov.cg2.get_coverage());
    $display("Coverpoint cp1: %0.2f%%", cov.cg1.cp1.get_coverage());
    $display("Coverpoint cp1: %0.2f%%", cov.cg2.cp1.get_coverage());
    $display("Hit count for bins b1 : %0d", cov.cg2.cp1.get_hitcount("b1"));
    $display("Hit count for bins b2 : %0d", cov.cg2.cp1.get_hitcount("b2"));
    $display("Hit count for bins b3 : %0d", cov.cg2.cp1.get_hitcount("b3"));
  end
endmodule