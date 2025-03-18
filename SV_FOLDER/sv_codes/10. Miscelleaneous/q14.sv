class Seas_Cloth;

  rand bit [1:0] clothes; 
  rand bit [1:0] season;  

  covergroup cs_covergroup;

    coverpoint clothes {
      bins woolen_coat = {0};
      bins lenin = {1};
      bins rainy_coat = {2};
           ignore_bins invalid_clothes = {3};
    }

    coverpoint season {
      bins winter = {0};
      bins summer = {1};
      bins rainy = {2};
 //     ignore_bins invalid_season = default; //default can not be assigned or used with ignore AND illegal bins
    }

    cross clothes, season {
      bins illegal_combination = binsof(clothes) intersect {1} && binsof(season) intersect {0}; // Example: lenin in winter
      ignore_bins ignored_combination = binsof(clothes) intersect {2} && binsof(season) intersect {1}; // Example: rainy_coat in summer
    }

  endgroup

//  cs_covergroup =new();
   
  function new();
    cs_covergroup = new();
  endfunction


endclass 

module tb;

  initial
    begin
    
    Seas_Cloth csc = new();

      repeat(20)
        begin
      csc.randomize();
      csc.cs_covergroup.sample();
          $display("Sampled values: Clothes = %0d, Season = %0d", csc.clothes, csc.season);
          $display("covg_percent : %0f", csc.cs_covergroup.get_coverage());
    end

    $display("Coverage results:");

  end

endmodule