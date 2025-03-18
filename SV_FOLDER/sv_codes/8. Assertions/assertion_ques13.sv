module assertion_seq;
  logic a, b, c, d;
  bit clk, reset;
  `define true 1'b1
  ////////////////////////////////////////////////
  
  sequence s1;
    a[*2] ##1 b[->2:5] ##2 c[*3] ##1 d;
  endsequence
  
  property ppt1;
    @(posedge clk) disable iff(reset) s1;
  endproperty
  assrt1: assert property (ppt1)
    $info("assertion ppt1 passed");
    else $error("assertion ppt1 failed");
  ///////////////////////////////////////////////
    
  sequence s2;  
    (a ##1 b[=5] ##1 c ##2 d);
  endsequence
   
  property ppt2;
    @(posedge clk) disable iff(reset) s2;
  endproperty
  assrt2: assert property (ppt2)
    $info("assertion ppt2 passed");  
    else $error("assertion ppt2 failed");
  //////////////////////////////////////////////
    
  sequence s3;
    (a ##3 b[*1] ##1 c[=2] ##1 d);
  endsequence
       
  property ppt3;
    @(posedge clk) disable iff(reset) s3;
  endproperty
  assrt3: assert property (ppt3)
    $info("assertion ppt3 passed");    
    else $error("assertion ppt3 failed");
  //////////////////////////////////////////////
    
  sequence s4; 
    (a ##1 1'b1 ##1 b) ##1 (a ##1 1'b1 ##1 b) ##1 (a ##1 1'b1 ##1 b);
  endsequence
  
  property ppt4;
    @(posedge clk) disable iff(reset) s4;
  endproperty
  assrt4: assert property (ppt4)
      $info("assertion ppt4 passed");
      else $error("assertion ppt4 failed");
  //////////////////////////////////////////////
    
  sequence s5;
    (a ##2 b)[*1:5];
  endsequence
  
  property ppt5;
     @(posedge clk) disable iff(reset) s5;
  endproperty
  assrt5: assert property (ppt5)
    $info("assertion ppt5 passed");
    else $error("assertion ppt5 failed");
  //////////////////////////////////////////////
    
  sequence s6;
    ((a&&b)||c)^d;
  endsequence
  
  property ppt6;
     @(posedge clk) disable iff(reset) s6;
  endproperty
  assrt6: assert property (ppt6)
    $info("assertion ppt6 passed");
    else $error("assertion ppt6 failed");
  //////////////////////////////////////////////
    
  sequence s7;
    ((a || b)^c)&& ~d;
  endsequence
  
  property ppt7;
    @(posedge clk) disable iff(reset) s7;
  endproperty
  assrt7: assert property (ppt7)
    $info("assertion ppt7 passed");
    else $error("assertion ppt7 failed");  
  //////////////////////////////////////////////
    
  sequence s8;
    s1 ##[4:10] s3;
  endsequence
  
  property ppt8;
     @(posedge clk) disable iff(reset) s8;
  endproperty
  assrt8: assert property (ppt8)
    $info("assertion ppt8 passed");
    else $error("assertion ppt8 failed");
  //////////////////////////////////////////////
    
  sequence s9;
//     (((~s1||~s2)&&(c^~d))||s3);
    s3 ##1(~a&&b)##[3:10]s8;
  endsequence
  
  property ppt9;
    @(posedge clk) disable iff(reset) s9;
  endproperty
  assrt9: assert property (ppt9)
    $info("assertion ppt9 passed");
    else $error("assertion ppt9 failed");
  //////////////////////////////////////////////
    
  sequence s10;
//     ((~a&&d)^(s1||s4))&& ~s2;    
    s2##[2:8]s3##[2:$]s7;
  endsequence
   
  property ppt10;
     @(posedge clk) disable iff(reset) s10;
  endproperty
  assrt10: assert property (ppt1)
    $info("assertion ppt10 passed");
    else $error("assertion ppt10 failed");
  //////////////////////////////////////////////
    
  sequence s11;
//     ((s1||s3&&s4##[4:6] s5;      
    s5 ##[3:6]a[*2]##1 b[*2:5] ##[1:$]s9;
  endsequence
  
  property ppt11;
    @(posedge clk) disable iff(reset) s11;
  endproperty
  assrt11: assert property (ppt11)
    $info("assertion ppt11 passed");
    else $error("assertion ppt11 failed");
 ///////////////////////////////////////////////
    
  sequence s12;
    s1 ##[3:6] s4 ##[4:6] s5;
  endsequence
     
  property ppt12;  
    @(posedge clk) disable iff(reset) s12;
  endproperty
  assrt12: assert property (ppt12)
    $info("assertion ppt12 passed");
    else $error("assertion ppt12 failed");
  ///////////////////////////////////////////////
    
  sequence s13;
//     (!(!((!s1||s3)&&s4)^s5&&s6||s7;
    s1##[1:4]s2##[2:10]s3##[3:19]s4##[5:10]s5;
  endsequence
        
  property ppt13;
    @(posedge clk) disable iff(reset) s13;
  endproperty
  assrt13: assert property (ppt13)
    $info("assertion ppt13 passed");
    else $error("assertion ppt13 failed");
  ///////////////////////////////////////////////
    
  sequence s14;
    a ##1 ((!b[*0:$] ##1 b)[*2:10]) ##1 c;
  endsequence
     
  property ppt14;
    @(posedge clk) disable iff(reset) s14;
  endproperty
  assrt14: assert property (ppt14)
    $info("assertion ppt14 passed");
    else $error("assertion ppt14 failed");
  ///////////////////////////////////////////////
    
  sequence s15(logic p, logic q, logic r);
      p[*4] ##1 q ##2 r;
  endsequence
    
  property ppt15;
    @(posedge clk) disable iff(reset) s15(a,b,c);
  endproperty
  assrt15: assert property (ppt15)
    $info("assertion ppt15 passed");
    else $error("assertion ppt15 failed");
    
    initial begin
      clk = 0;
      forever #20 clk = ~clk;
    end
    
    initial begin
      reset = 1;
      #10 reset = 0;
    end
    
    initial begin
      repeat(20) begin
        #10;
        std::randomize(a,b,c,d);
      end
    end
    
        
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #500 $finish; 
    end
    endmodule
    
    
    
    
  
