module covergroup_pkt;
  bit [3:0] a, b; //0-15
  bit [7:0] c;  //0-255
  
  covergroup cg;
    option.per_instance = 1;
    option.name = "cover_group";  //assign name to covergroup
//     option.goal = 70;            //
//     option.auto_bin_max = 32;
//     option.at_least = 1;
    
    cp1: coverpoint a {option.goal = 80;
      					option.auto_bin_max = 3;  
//                        option.weight = 1;
                       bins a1 = {1,2,3,4};
                       bins a2[] = {[5:7], 8};
                       bins a3[2] = {10,12,14};
                       bins a4 = default;
                      }
    cp2 : coverpoint b {option.auto_bin_max = 2;
                        option.goal = 50;
                        option.at_least = 2;
                        bins b1 = {1,2,3,4,5};
                        bins b2[3] = {10,11,12,13};
                        bins b3 = default;
                       }
//     cp3 : coverpoint c { option.at_least = 5;
//                         option.goal = 100;
// //                         option.weight = 2;
//                        option.auto_bin_max = 64;
//                        }
    cp3 : coverpoint c {
      option.at_least = 2;
      option.goal = 100;
//       option.auto_bin_max = 64;
      bins low = {0};
      bins mid_low = {[1:100]};
      bins mid = {[101:200]};
      bins high = {[201:255]};
    }
  endgroup
  
  cg c1, c2;
  initial begin
    c1 = new();
    c2 = new();
//     repeat(55) begin
//       a = $random;
//       b = $random%15;
//       c = $random;
    for(int i=0; i<70; i++) begin
      a = i;
      b = i;
      c = i;
      c1.sample();
      c2.sample();
    end
    $display("Coverage Report");
    $display("coverage report: %0.2f",c1.get_coverage());
    $display("coverage report of c1.cp1: %0.2f",c1.cp1.get_coverage());
    $display("coverage report of c1.cp2: %0.2f",c1.cp2.get_coverage());
    $display("coverage report of c1.cp3: %0.2f",c1.cp3.get_coverage());
    $display("instant coverage of c1: %0.2f",c1.get_inst_coverage());
    
    $display("coverage report: %0.2f",c2.get_coverage());
    $display("coverage report of c1.cp1: %0.2f",c2.cp1.get_coverage());
    $display("coverage report of c1.cp2: %0.2f",c2.cp2.get_coverage());
    $display("coverage report of c1.cp3: %0.2f",c2.cp3.get_coverage());
    $display("instant coverage of c1: %0.2f",c2.get_inst_coverage());
    
    $display("Hit bins a2[0]: %0.2f",c1.cp1.get_hitcount("a2[0]"));
    $display("Hit bins b1: %0.2f",c1.cp2.get_hitcount("b1"));
    $display("Hit bins b2[0]: %0.2f",c1.cp2.get_hitcount("b2[0]"));
    $display("Hit bins b2[1]: %0.2f",c1.cp2.get_hitcount("b2[1]"));
    $display("Hit bins b2[2]: %0.2f",c1.cp2.get_hitcount("b2[2]"));
    $display("Hit bins b2[3]: %0.2f",c1.cp2.get_hitcount("b2[3]"));
    $display("Hit bins mid_low: %0.2f",c1.cp3.get_hitcount("mid_low"));
    $display("Hit bins mid: %0.2f",c1.cp3.get_hitcount("mid"));
    $display("Hit bins high: %0.2f",c1.cp3.get_hitcount("high"));
  end
endmodule
      
      
    
  
  
    
                        
                       
      
      
      
    
  
