class coverage_test;
  typedef enum bit[1:0] {SUMMER = 2'b00,
                         WINTER = 2'b01, 
                         RAINY = 2'b10} season_t;

  typedef enum bit[1:0] {WOOLEN_COAT = 2'b00,
                         LENIN = 2'b01, 
                         RAINY_COAT = 2'b10} clothes_t;
  
  rand season_t season;
  rand clothes_t clothes;
  
  covergroup cg;
    option.name = "coverage_cross";
    option.per_instance = 1;
    option.goal = 100;
    option.weight = 1;
    option.at_least = 1;
    
    cp1: coverpoint season{
      bins summer = {SUMMER};
      bins winter = {WINTER};
      bins rainy = {RAINY};
    }
    
    cp2: coverpoint clothes{
      bins woolen = {WOOLEN_COAT};
      bins lenin = {LENIN};
      bins rainy_coat = {RAINY_COAT};
    }
    
    season_clothes: cross cp1, cp2 {
      bins a1 = binsof(cp1.summer) && binsof(cp2.lenin);
      bins a2 = binsof(cp1.winter) && binsof(cp2.woolen);
      bins a3 = binsof(cp1.rainy) && binsof(cp2.rainy_coat);
      bins b1 = binsof(cp1) intersect{SUMMER} && binsof(cp2) intersect{WOOLEN_COAT};
//       illegal_bins a4 = binsof(cp1.summer) && binsof(cp2.woolen);
      illegal_bins a5 = binsof(cp1.winter) && binsof(cp2.lenin);
      illegal_bins a6 = binsof(cp1.rainy) && binsof(cp2.lenin);
      ignore_bins a7 = binsof(cp1.winter) && binsof(cp2.rainy_coat);
      ignore_bins a8 = binsof(cp1.summer) && binsof(cp2.rainy_coat);
      ignore_bins a9 = binsof(cp1.rainy) && binsof(cp2.woolen);
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
    repeat(20) begin
      cov.randomize();
      $display("season:%0d, clothes:%0d", cov.season, cov.clothes);
      cov.cg.sample();
    end
    $display("Total Coverage Report: %0.2f%%", cov.cg.get_coverage());
    $display("Coverage of coverpoint cp1: %0.2f%%",cov.cg.cp1.get_coverage());
    $display("Coverage of coverpoint cp2: %0.2f%%",cov.cg.cp2.get_coverage());  
    $display("Coverage of cross season_clothes: %0.2f%%",cov.cg.season_clothes.get_coverage());
  end
endmodule
  
  
    
    
    
    
