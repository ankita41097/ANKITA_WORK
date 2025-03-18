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



