module func_coverage;
  bit clk;
  bit [5:0] a;
always #5 clk=~clk;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    option.goal = 100;
    option.at_least = 1;
//      option.auto_bin_max = 2;
    
    cp1: coverpoint a {
      bins b1 = (4=>16=>21=>26=>7=>1=>31=>14=>5);
      bins b2 = (6=>26=>11=>2=>7=>10=>3=>15=>5);
      bins b3 = (0=>2=>4=>6=>8=>10=>12=>14=>16=>18=>20=>22=>24=>26=>28=>30);
      bins b4 = (0=>1=>2=>3=>5=>6=>7=>9=>10=>11=>13=>14=>15=>17=>18=>19=>
                 21=>22=>23=>25=>26=>27=>29=>30=>31);
    }
  endgroup
  
  cg c1 = new();
  
  initial begin
    a = 4;
    @(negedge clk) a = 16; @(negedge clk) a = 21; @(negedge clk) a = 26; @(negedge clk) a = 7; @(negedge clk) a = 1; 
	@(negedge clk) a = 31; @(negedge clk) a = 14; @(negedge clk) a = 5;
    
    @(negedge clk) a = 6; @(negedge clk) a = 26; @(negedge clk) a = 11; @(negedge clk) a = 2; @(negedge clk) a = 7; 
	@(negedge clk) a = 10; @(negedge clk) a = 3; @(negedge clk) a = 15; @(negedge clk) a = 5;
    
    @(negedge clk) a = 0; @(negedge clk) a = 2; @(negedge clk) a = 4; @(negedge clk) a = 6; @(negedge clk) a = 8; 
	@(negedge clk) a = 10; @(negedge clk) a = 12; @(negedge clk) a = 14; @(negedge clk) a = 16; @(negedge clk) a = 18; 
	@(negedge clk) a = 20; @(negedge clk) a = 22; @(negedge clk) a = 24; @(negedge clk) a = 26; @(negedge clk) a = 28;
    @(negedge clk) a = 30;
    
    @(negedge clk) a = 0; @(negedge clk) a = 1; @(negedge clk) a = 2; @(negedge clk) a = 3; @(negedge clk) a = 5; 
	@(negedge clk) a = 6; @(negedge clk) a = 7; @(negedge clk) a = 9; @(negedge clk) a = 10; @(negedge clk) a = 11; 
	@(negedge clk) a = 13; @(negedge clk) a = 14; @(negedge clk) a = 15; @(negedge clk) a = 17; @(negedge clk) a = 18;  		
	@(negedge clk) a = 19; @(negedge clk) a = 21; @(negedge clk) a = 22; @(negedge clk) a = 23; @(negedge clk) a = 25; 
	@(negedge clk) a = 26; @(negedge clk) a = 27; @(negedge clk) a = 29; @(negedge clk) a = 30; @(negedge clk) a = 31; @(negedge clk); 
    
    $display("Total coverage report: %0.2f%", c1.get_coverage());
	$display("Instant coverage report: %0.2f%", c1.get_inst_coverage());
	$display("Coverage Report of cp1: %0.2f", c1.cp1.get_coverage());
  end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #700 $finish;
    end
endmodule

    
  
