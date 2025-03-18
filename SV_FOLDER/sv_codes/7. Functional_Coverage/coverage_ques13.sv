module mux_2x1(         
  input bit a,            
  input bit b,
  input bit sel,
  output bit y  
);

  always_comb
    begin
      if (sel == 0) begin
        y = a;       // If sel = 0, output is A
        $display("a:%0d sel:%0d, y:%0d",a,sel,y);
      end else 
        begin
          y = b;    // If sel = 1, output is B
          $display("b:%0d, sel:%0d, y:%0d",b,sel,y);
        end
    end
endmodule


interface mux_if();
  logic a, b, sel;
  logic y;
  endinterface

class coverage_mux;
  virtual mux_if vif;     //interface handle
  rand logic a, b, sel;
  logic y;
  
  covergroup cg_mux;
    option.name = "coverage_2x1_mux";
    option.per_instance = 1;
    option.at_least = 1;
    option.weight = 1;
    option.goal = 100;
    
    cp_in1: coverpoint a {
      bins a1[] = {0,1};
    }
    cp_in2: coverpoint b {
      bins a1 = {0};
      bins a2 = {1};
    }
    cp_sel: coverpoint sel {
      bins a1 = {0};
      bins a2 = {1};
    }
    cp4_y: coverpoint y;  
//       bins out_0 = {0};
//       bins out_1 = {1};
    
    cross_a: cross cp_sel, cp_in1;   //between coverpoints
    cross_b: cross cp_sel, cp_in2;
    cross_c: cross a, sel;   //between signals
    cross_d: cross a, cp_sel;
  endgroup
  
  function new(virtual mux_if vif);   //passing virtual intrfce handle
    cg_mux = new();
    vif = this.vif;
  endfunction
endclass

module tb;
  mux_if cif();   
  
  mux_2x1 dut (.a(cif.a), .b(cif.b), .sel(cif.sel), .y(cif.y));
  coverage_mux cov;
  
  initial begin
    cov = new(cif);
      begin
        repeat(10) begin
          #1;
          cov.randomize();
          cif.a = cov.a;
          cif.b = cov.b;
          cif.sel = cov.sel;
          cov.cg_mux.sample();
//           $display("a:%0d, b:%0d, sel:%0d, y:%0d",cif.a, cif.b, cif.sel, cif.y);
        end
        $display("Total coverage report: %0.2f%%",cov.cg_mux.get_coverage());
        $finish();
      end
  end    
endmodule
        
        
        
    
    
    
    
  
  
  
  
    
    
    

  
  
  
  
  
  
  
  
  
  
  
  
  
  