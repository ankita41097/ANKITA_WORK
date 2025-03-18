module assertions_operators;
  bit clk;
  bit reset;
  logic en;
  logic a, b, c, d, e;
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
  end
  
  //Assertions
  
  //1. [*], [*n], [*m:n], [->], [=]
  property ppt1;
    disable iff(reset)
    @(posedge clk) a |-> b[*1:$];
  endproperty
  assert1: assert property (ppt1) 
    $info("assertion ppt1 passed");
    else $error("assertion ppt1 failed");
  
  //2. [*n]
  property ppt2;
    disable iff(reset)
    @(posedge clk) a |-> b[*3];
  endproperty
  assert2: assert property( @(posedge clk)(ppt2))
    $info("assertion ppt2 passed");
    else $error("assertion ppt2 failed");
  
  //3. [*m:n]
  property ppt3;
    disable iff(reset)
    @(posedge clk) a |=> b[*2:5];
  endproperty
  assert3: assert property (ppt3)
    $info("ppt3 passed");
    else $error("assertion ppt3 failed");
    
  //4. [->m:n]  
  property ppt_1;
    disable iff(reset)
    @(posedge clk) a ##2 b[->2:5] ##1 c;
  endproperty
  assrt_1: assert property (ppt_1)
    $info("ppt_1 passed");
    else $error("assertion ppt_1 failed");
    
  //5. [=m:n]  
  property ppt_2;
    disable iff(reset)
    @(posedge clk) a |=> b[=3:7] ##2 c;
  endproperty
  assrt_2: assert property (ppt_2)      
    $info("ppt_2 passed");
    else $error("assertion ppt_2 failed");
      
  //6. intersect- a and b, and c,d,e must occur together
  property ppt4;
    disable iff(reset)
    @(posedge clk) (a ##3 b) intersect (c ##1 d ##2 e);
  endproperty
  assert4: assert property (ppt4) 
    $info("%t assertion ppt4 passed",$realtime);
    else $error("assertion ppt4 failed");
    
  //7. within - a should happen inside b and c seq
  property ppt5;
    disable iff(reset)
    @(posedge clk) (a) within (b ##1 c);
//     @(posedge clk) (valid) [*5] within ($rose (req) ##1 (req) [*6]);
  endproperty
  assert5: assert property (ppt5) 
    $info("assertion ppt5 passed"); 
    else $error("assertion ppt5 failed");
    
  //8. throughout a should be high till b and c are high
  property ppt6;
    disable iff(reset)
    @(posedge clk) (a) throughout (b ##1 c);
  endproperty
  assert6: assert property (ppt6) 
    $info("assertion ppt6 passed");
    else $error("assertion ppt6 failed");
  
  //9. and both should pass
  property ppt7;
    disable iff(reset)
    @(posedge clk) (a ##1 b) and (c ##1 d ##2 e);
  endproperty
  assert7: assert property (ppt7) 
    $info("assertion ppt7 passed");
    else $error("assertion ppt7 failed");
  
  //10. or - either of the one should pass  
  property ppt8;
    disable iff(reset)
    @(posedge clk) (a ##[1:4] b) or (c ##2 d ##1 e); 
  endproperty
  assert8: assert property (ppt8) 
    $info("assertion ppt8 passed");
    else $error("assertion ppt8 failed");
  
  //11. until  
  property ppt9;
    disable iff(reset)
    @(posedge clk) (a) until (b);
  endproperty
  assert9: assert property (ppt9) 
    $info("assertion ppt9 passed");
    else $error("assertion ppt9 failed");
  
  //12. firstmatch
  property ppt10;
    disable iff(reset)
    @(posedge clk) first_match (a ##[1:4]b ##1 c);
  endproperty
  assert10: assert property (ppt10)
    $info("assertion ppt10 passed");
    else $error("assertion ppt10 failed");  
  
  //13. if-elsif-else
  property ppt11;
//     disable iff(reset)
    @(posedge clk)
    if(en) a == 1
    else if (b) c == 0
    else d == 1;
  endproperty
  assert11: assert property (ppt11)
    $info("assertion ppt11 passed");
    else $error("assertion ppt11 failed");
    
//   14. case
//   property ppt12;
//     disable iff(reset)
//     @(posedge clk) 
//     case({a,b})
//       begin
//         2'b10: c == 0;  
//         2'b01: d == 1;  
//         default: c == 1;
//       end    
//     endcase
//   endproperty
//   assert12: assert property (ppt12) 
//     $info("assertion ppt12 passed");
//     else $error("assertion ppt12 failed");
    
   
    initial begin
      repeat(50) begin
        #10;
//         b=1;
//         c=1; 
//         d=1;
//         e=1;
        std::randomize(a,b,c,d,e,en);
        #10 $display("a:%0d, b:50d, c:%0d, d:%0d, e:%0d, en:%0d",a,b,c,d,e,en);
      end
    end
    
    initial begin
      #10 $assertoff;
      #100 $asserton;
    end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;      
      #200 $finish;
    end
    endmodule
    
    
    
    
  

