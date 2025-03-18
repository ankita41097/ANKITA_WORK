module func_coverage;
  bit clk=0;
  bit [5:0] a,b,c,d;
  
always #1 clk=~clk;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    option.goal = 100;
    option.at_least = 1;
//      option.auto_bin_max = 2;
    
    cp1: coverpoint a {
      bins b1 = (4=>16=>21=>26=>7=>1=>31=>14=>5);
    }

    cp2: coverpoint b {
      bins b2 = (6=>26=>11=>2=>7=>10=>3=>15=>5);
    }
    
    cp3: coverpoint c {
      bins b3 = (0=>2=>4=>6=>8=>10=>12=>14=>16=>18=>20=>22=>24=>26=>28=>30);//([0:31]) with (item%2 == 0);
    }
      
    cp4: coverpoint d{
      bins b4 = (0=>1=>2=>3=>5=>6=>7=>9=>10=>11=>13=>14=>15=>17=>18=>19=>
                 21=>22=>23=>25=>26=>27=>29=>30=>31);  //[0:31] with (item%4 != 0);
    }
  endgroup
  
  cg c1 = new();
 

  initial
    begin
      a = 4;  b = 6; 
      #2 a = 16; b = 26;
      #2 a = 21; b = 11;
      #2 a = 26; b = 2;
      #2 a = 7;  b = 7;
      #2 a = 1;  b = 10;
      #2 a = 31; b = 3;
      #2 a = 14; b = 15;
      #2 a = 5;  b = 5;
    end
  
  initial
    begin
      for(int i=0; i<=30; i++)
        begin
          #2;
          c = c+2;
          $display("c:%0d",c);
        end          
      end  
  
 initial begin
    for(int i=0; i<32; i++)
      begin
        if(i>0 && i%4==0)
          begin
            continue;
          end
            else begin
              #2;
              d = i;
              $display("d:%0d",d);
            end    
      end
 end
  
  initial begin
    #500;
    $display("Total coverage report: %0.2f%", c1.get_coverage());
    $display("Instant coverage report: %0.2f%", c1.get_inst_coverage());
    $display("Coverage Report of cp1: %0.2f", c1.cp1.get_coverage());
    $display("Coverage Report of cp2: %0.2f", c1.cp2.get_coverage());
    $display("Coverage Report of cp3: %0.2f", c1.cp3.get_coverage());
    $display("Coverage Report of cp4: %0.2f", c1.cp4.get_coverage());
    $finish();
  end
endmodule
  
