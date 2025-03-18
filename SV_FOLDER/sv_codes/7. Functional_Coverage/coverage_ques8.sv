class coverage_test;
  rand bit[3:0] a,b,c,d;
  bit clk=0;
  
  covergroup cg @(posedge clk);
    option.per_instance = 1;
    option.goal = 100;
    option.at_least = 1;
    
    cp1: coverpoint a {
      bins a1 = (2[*3] => 4);     //222
    }
    cp2: coverpoint b {
      bins b1 = (4[*2:5] => 6);  //4=>4=>4, 4=>4=>4=>4, 4=>4=>4=>4=>4
    }
    cp3: coverpoint c {
      bins c1 = (5 => 6[->2] => 7);  //5...6...6 => 7
    }
    cp4: coverpoint d {
      bins d1 = (2 => 8[=3] => 15);  //2...8...8...8...15
    }
  endgroup
  function new();
    cg = new();
  endfunction
endclass

module tb;
  coverage_test cov = new();
  initial begin
    forever #1 cov.clk = ~cov.clk;
  end
  
	// 2[*3] => 4   after 1, 2 should come 3-times then after 4 should come
  initial begin  
    #2 cov.a = 1;
    #2 cov.a = 2;
    #2 cov.a = 2;
    #2 cov.a = 2;
    #2 cov.a = 4;
  end
  initial begin
   #20;
    $display("Total coverage report = %0.2f%%",cov.cg.get_coverage());
    $display("Coverage of cp1 = %0.2f%%",cov.cg.cp1.get_coverage());
  end
  
	// 4[*2:5] => 6  4 should come in a range of [2:5] times, then after 6 shld come
  initial begin
  	#2 cov.b = 2;
    #2 cov.b = 4;
    #2 cov.b = 4;
    #2 cov.b = 4;
    #2 cov.b = 4;
    #2 cov.b = 6;
  end
  initial begin
    #20;
    $display("Total coverage report = %0.2f%%",cov.cg.get_coverage());
    $display("Coverage of cp2 = %0.2f%%",cov.cg.cp2.get_coverage());
  end
    
	//5 => 6[->2] => 7  in between 5-7, 6 can come anytime 2times. after 6, 7 should come immediately
  initial begin
//     #2 cov.c = 1;
    #2 cov.c = 5;
    #2 cov.c = 6;    //1st
    #2 cov.c = 10;
    #2 cov.c = 11;
    #2 cov.c = 6;    //2nd
//     #2 cov.c = 1;
    #2 cov.c = 7;
  end
  initial begin
   #20;
    $display("Total coverage report = %0.2f%%",cov.cg.get_coverage());
    $display("Coverage of cp3 = %0.2f%%",cov.cg.cp3.get_coverage());
  end
  
	//2 => 8[=3] => 15 (in between 2-7, 5 can come anytime 3-times anywhere
  initial begin
//     #2 cov.d = 1;
    #2 cov.d = 2;
    #2 cov.d = 8;    //1st
    #2 cov.d = 6;
    #2 cov.d = 5;
    #2 cov.d = 8;    //2nd
    #2 cov.d = 10;
    #2 cov.d = 11;
    #2 cov.d = 8;    //3rd
    #2 cov.d = 12;
    #2 cov.d = 15;
  end
  initial begin
   #22;
    $display("Total coverage report = %0.2f%%",cov.cg.get_coverage());
    $display("Coverage of cp4 = %0.2f%%",cov.cg.cp4.get_coverage());
    $finish;
  end
endmodule
    

      
      
    
    
    