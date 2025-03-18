class coverage_test;
  bit[31:0] a;    //32-bit
  int b;          // 32-bit
  byte c;        //8-bit
  integer d;
  
  covergroup cg;
    option.name = "coverage_cross_bins";
    option.per_instance = 1;
    option.goal = 100;
    option.weight = 1;
    option.at_least = 1;
    option.auto_bin_max = 2;
    
    cp1: coverpoint a{
      bins a1[] = {[0:10]};              
      bins a2  = {[11:20]};
      bins a3[] = {[21:30]};
    }
    cp2: coverpoint b{  
      bins a1 = {[0:20]};
      bins a2[] = {[21:40]};
      bins a3 = {[41:60]};
    }
    cp3: coverpoint c{
      bins a1 = {[0:10]};
      bins a2 = {[11:30]};
      bins a3[] = {[0:100]};
    }
    cp4: coverpoint d{
      bins a1 = {[0:100]};
      bins a2[] = {[101:200]};
    }
    
    cross_c1: cross cp1, cp2{
      bins a1 = binsof(cp1.a2) intersect {[12:15]};
      bins a2 = binsof(cp1.a3) intersect {[22:28]} && binsof(cp2.a2) intersect {[25:30]};
      bins a3 = binsof(cp1.a1) intersect {[5:8]} || binsof(cp2.a1) intersect {[5:15]};
    }
    cross_c2: cross cp3, cp4{
      bins a4 = binsof(cp3.a3) intersect {[0:50]} || binsof(cp4.a2) intersect{[0:50]} with (cp3 == cp4);
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
    repeat(15) begin
    cov.randomize(); 
	cov.a = $urandom_range(0,100);  
	cov.b = $urandom_range(0,100);
    cov.c = $urandom_range(0,100);
    cov.d = $urandom_range(0,200);
    $display("a=%0d, b=%0d, c=%0d, d=%0d", cov.a, cov.b, cov.c,cov.d);
    cov.cg.sample();
    end
    $display("Total Coverage Report: %0.2f%%",cov.cg.get_coverage());
  end
endmodule
    