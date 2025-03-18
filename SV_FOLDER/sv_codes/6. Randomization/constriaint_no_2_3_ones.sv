//should not have consecutive ones
class packet;  
  rand bit [15:0] data;
  
  constraint c1 {foreach (data[i]){
    if(data[i]==1 && i<15)
      data[i+1]==0;}}
endclass

module top;
  packet pkt;
  
  initial begin
    pkt = new();
    repeat (5) begin
      pkt.randomize();
//       $display("Data value = %0b", pkt.data);
      if (pkt.randomize()) begin
        $display("Randomized Data: %b", pkt.data);
      end 
      else
        $display("Randomization Failed");  
    end
  end
endmodule

**************************************************************************************************
//total no of 1s should be 3 and should not have consecutive 1s
class packet;
  rand bit[7:0] data;
  
  constraint c1{data[0]+ data[1] + data[2] + data[3] + data[4] + data[5] + data[6] + data[7] == 3;}
  
  constraint c2{foreach (data[i]) {
    if(data[i]==1 && i<7)
      data[i+1]==0;}}
    
endclass
    
    module top;
      packet pkt;
      initial begin
        pkt = new();
        repeat(5) begin
          pkt.randomize();
          $display("Data value = %b -> %0d", pkt.data, pkt.data);
        end
      end
    endmodule

