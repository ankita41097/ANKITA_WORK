interface intf(input bit clk);
  logic [31:0] a;
  logic [31:0] b;
  logic [31:0] a1;
  logic [31:0] b1;

//     clocking cb @ (posedge clk);
//         default input #1 output #1;
//     endclocking

    modport M1 (input a,b, output a1,b1, import add, import multiply);
    modport N1 (input a1,b1,output a, b, import multiply, import add);

    //task for addition
    task add(input logic [31:0] x, y, output logic [31:0] sum);
        sum = x + y;
    endtask

    //task for multiplication
    task multiply(input logic [31:0] x, y, output logic [31:0] product);
        product = x * y;
    endtask
endinterface

                
class conn_class;
  
    rand bit[3:0] a,b;
   
    virtual intf v_intf;  //virtual intrf to connect intrface with class
  constraint c1 {a inside {[1:10]};
                 b inside {[1:10]};
                }
    function new(virtual intf v_intf);
        this.v_intf = v_intf;
    endfunction

    function void run();
        // Any specific operations can be performed here
//       v_intf.M1.a = a;
//       v_intf.M1.b = b;
      
      v_intf.N1.a1=a; //intf_hndl.modport.signal
      v_intf.N1.b1=b;
//       $display("run c1.a =%0d,c1.b=%0d",a,b);
//       $display("intf c1.a =%0d,c1.b=%0d",v_intf.M1.a,v_intf.M1.b);
    endfunction
endclass

module top;
    bit clk=0;
    logic rst;

    // Clock generation
    always #5 clk = ~clk;
  
  intf intf(.clk(clk)); // Instantiate the interface
  m M11(.m_intf(intf),.clk(clk));
  n N11(.m_intf(intf),.clk(clk));
  conn_class c1;

    // Testbench stimulus with random value generation
    initial begin
      c1 = new(intf);
      c1.randomize();
      $display("c1.a =%0d,c1.b=%0d",c1.a,c1.b);
      c1.run();
      $display("intf 0 c1.a =%0d,c1.b=%0d",intf.M1.a,intf.M1.b);
//       $display("intf 5 c1.a =%0d,c1.b=%0d",intf.M1.a,intf.M1.b);
//       M11.m_intf.M1.a = 3;
//       M11.m_intf.M1.b = 2;
    end

    // End simulation after a certain time
  initial 
   begin  //{
     $dumpfile("dump.vcd");
     $dumpvars;
     #150 $finish;
   end  //}
endmodule

module m (intf m_intf,input bit clk);
    //logic [7:0] sum, product;

    always @(posedge clk) 
      begin
        //#1;
        m_intf.M1.add (m_intf.M1.a, m_intf.M1.b, m_intf.M1.a1);
        m_intf.M1.multiply (m_intf.M1.a, m_intf.M1.b, m_intf.M1.b1);
        $display($time,"Module M: a1 is %0d,b1 is %0d",m_intf.M1.a1,m_intf.M1.b1);
    end
endmodule

                
                
module n (intf m_intf,input bit clk);
    //logic [7:0] sum, product;

    always@(posedge clk) 
      begin
        //#1;
        m_intf.N1.multiply (m_intf.N1.a1, m_intf.N1.b1, m_intf.N1.a);
        m_intf.N1.add (m_intf.N1.a1, m_intf.N1.b1, m_intf.N1.b);
        $display($time,"Module N: a is %0d,b is %0d",m_intf.N1.a,m_intf.N1.b);
    end
endmodule



