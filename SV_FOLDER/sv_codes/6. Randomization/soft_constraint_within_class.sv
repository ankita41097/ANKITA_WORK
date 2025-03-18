//diff class same constraint name will work
class packet_A;
  rand bit [7:0] num1;
  
  constraint c1{ num1 inside {[10:40]};} //between 10 - 40
endclass

class packet_B;
  rand packet_A pkt1 = new();
  rand bit [7:0] num2;
  
  constraint c2 { num2 > 30; num2 < 60;} //betwn 100 - 200
  constraint c3 { num2 < pkt1.num1;} 
  constraint c4 { soft num2 > pkt1.num1;} 
  constraint c1 { pkt1.num1 inside {[30:70]};}
endclass

module top;
  packet_B pkt2 = new();
  initial begin
//     repeat(5) begin
    if(pkt2.randomize()) begin
      $display("Randomization successful -> num2 value: %0d", pkt2.num2);
      $display("num1 value: %0d", pkt2.pkt1.num1);
    end  
    else begin 
      $display("Randomization failed");
    end
//     end
  end
endmodule

*********************************************************************************************
  
//if a class having same name constraints then randomization failure will occur. if hving diff names then it will check for conflict.
class packet_A;
  rand bit [7:0] num1;
  
  constraint c1{
   num1 <= 40;
   num1 >= 10;
  }
  constraint c2{ soft num1 inside {[50:70]};}
//   constraint c1{ num1 inside {[80:70]};}

endclass

module top;
  packet_A pkt1;
  initial begin
    pkt1 = new();
   repeat(5) begin 
    if(pkt1.randomize()) begin
      $display("num1 value: %0d", pkt1.num1);
    end
      else begin 
      $display("Randomization failed");
      end 
   end
  end
endmodule
 
  
  



