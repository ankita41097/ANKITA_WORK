module decoder4x10(
  input  bit [3:0] a,  
  input  bit en,  
  output logic [9:0] y
);
  always_comb 
  begin
	y = 10'b0;
    if (en) begin
      case (a)
        4'd0: y = 10'b0000000001;
        4'd1: y = 10'b0000000010;
        4'd2: y = 10'b0000000100;
        4'd3: y = 10'b0000001000;
        4'd4: y = 10'b0000010000;
        4'd5: y = 10'b0000100000;
        4'd6: y = 10'b0001000000; 
        4'd7: y = 10'b0010000000; 
        4'd8: y = 10'b0100000000; 
        4'd9: y = 10'b1000000000; 
        default: y = 10'b0;       
      endcase
    end
  end
endmodule

module tb;
  logic [3:0] a;   
  logic en;
  logic [9:0] y;

  decoder4x10 dut (
    .a(a),
    .en(en),
    .y(y)
  );
  
  initial begin
    repeat (100) begin
      a = $urandom_range(0, 15);
      en = $urandom_range(0, 1);
      #1; 
      $display("Input = %b, Enable = %b, Output = %b", a, en, y);
    end
    #100;
    $finish();
  end
endmodule
  
bind decoder4x10 coverage_dec cov (
    .a(a), 
    .en(en), 
    .y(y)
  );

module coverage_dec(
  input logic [3:0] a, 
  input logic en, 
  input logic [9:0] y
);

  covergroup cg;
  
  option.name = "decoder4x10_coverage";
  option.per_instance = 1;
  option.at_least = 1;
  option.goal = 100;
  option.weight = 1;
    
	in_cp: coverpoint a {
      bins valid_input[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
//       ignore_bins ig_bin = default;
    }
    
    en_cp: coverpoint en {
      bins enabled = {1};    
      bins disabled = {0}; 
    }

    out_cp: coverpoint y {
      bins a1 = {10'b0000000000};        
      wildcard bins one_hot[] = {10'bxxxxxxxxxx}; // Any valid one-hot output
    }
    
    cross_in_en: cross a, en;
    cross_in_out: cross a, y;
    cross_en_out: cross en, y;
  endgroup
  
  cg c1;
  
  initial begin
    c1 = new();
    #1;
    c1.sample();
  end
  
  final begin
    $display("Total Coverage:%0.2f%%",c1.get_coverage());
    $display("Input Coverage: %0.2f%%", c1.in_cp.get_coverage());
    $display("Enable Coverage: %0.2f%%", c1.en_cp.get_coverage());
    $display("Output Coverage: %0.2f%%", c1.out_cp.get_coverage());  
//   $finish;
  end
endmodule