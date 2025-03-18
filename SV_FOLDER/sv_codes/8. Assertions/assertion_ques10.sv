class encoder_16x4;
  rand bit[15:0] in;
  
  constraint c1{$onehot(in);}
  
  function void display();
    $display("at time %t in:%0b",$time, in);
  endfunction
endclass

module tb;
  bit[15:0] tb_in;
  bit[3:0] tb_out;
  bit clk, reset;
  
  encoder_16x4 enc = new();
  
  always @(*) begin
    case(tb_in)
      16'b0000_0000_0000_0001: tb_out = 4'b0000;
      16'b0000_0000_0000_0010: tb_out = 4'b0001;
      16'b0000_0000_0000_0100: tb_out = 4'b0010;
      16'b0000_0000_0000_1000: tb_out = 4'b0011;
      16'b0000_0000_0001_0000: tb_out = 4'b0100;
      16'b0000_0000_0010_0000: tb_out = 4'b0101;
      16'b0000_0000_0100_0000: tb_out = 4'b0110;
      16'b0000_0000_1000_0000: tb_out = 4'b0111;
      16'b0000_0001_0000_0000: tb_out = 4'b1000;
      16'b0000_0010_0000_0000: tb_out = 4'b1001;
      16'b0000_0100_0000_0000: tb_out = 4'b1010;
      16'b0000_1000_0000_0000: tb_out = 4'b1011;
      16'b0001_0000_0000_0000: tb_out = 4'b1100;
      16'b0010_0000_0000_0000: tb_out = 4'b1101;
      16'b0100_0000_0000_0000: tb_out = 4'b1110;
      16'b1000_0000_0000_0000: tb_out = 4'b1111;
      default: tb_out = 4'bxxxx;
    endcase
  end
  
  always @(*)begin
    assrt1: assert ($onehot(tb_in))
      $info("assertion passed, input:%0b",tb_in);
    else $error("assertion failed, input:%0b",tb_in);
  end
  
  always @(*)begin
    assrt2: assert (tb_out == $clog2(tb_in))
      $info("assertion passed, input:%0b, output:%0b",tb_in, tb_out);
    else $error("assertion failed, input:%0b, output:%0b",tb_in, tb_out);
  end
  
  always @(*) begin
    assrt3: assert (!$isunknown(tb_out)) 
      $info("assertion passed. output is a known value");
    else $error("assertion failed. output has unknown (X/Z) value");
  end
  
  initial begin
    reset = 1;
    #10 reset = 0;
  end
  
  initial begin
    repeat(20)begin
      #10;
      enc.randomize();
      tb_in = enc.in;
      enc.display();
    end
  end
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #300 $finish;
  end  
endmodule
  
  
  
  
  
  
  
  
    
  
