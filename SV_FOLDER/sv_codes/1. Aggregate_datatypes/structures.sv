module strct1;
  struct {
    bit [7:0]opcode;
    bit[23:0]addr;
  } ir;
  initial
    begin
      ir.opcode = 1;
      ir.addr = 56;
      $display("Details: %p", ir);
    end
endmodule


module strct2;
  typedef struct{
    bit [7:0]opcode;
    bit[23:0]addr;
    string pkt_name;
  } instr;
  instr i1;
  initial
    begin
      i1.opcode = 'd34;
      i1.addr = 'hdefabc;
      i1.pkt_name = "Good pkt";
      $display("opcode: %d", i1.opcode);
      $display("addr: %h", i1.addr);
      $display("Packet name: %s", i1.pkt_name);
      $display("Details: %p",i1);
    end
endmodule

module strct3;
  typedef struct{
    string name;
    int id;
  } details;

  typedef struct{
    bit [23:0] marks_total;
    real percentage;
    details d1;
  } res;
  res r1;
  
  initial
    begin
      r1.d1.name = "Ankita Banerjee";
      r1.d1.id = 101;
      r1.marks_total = 500;
      r1.percentage = 85.67;
      $display("Students details: %p",r1);
      $display("Name: %s", r1.d1.name);
      $display("Id: %0d", r1.d1.id);
      $display("Total Marks Obtained: %0d", r1.marks_total);
      $display("Percentage: %0f", r1.percentage);
    end
endmodule

module strct4_packed;
  typedef struct packed signed{
    int a;     
    byte b;
    shortint c;
    bit[7:0] d;
    logic [31:0] e;
    //string name;
  } pkt;
  pkt p1;
  initial
    begin
      p1.a = 'habcd_def6;
      p1.b = 'd54;
      p1.c = 'habcd;
      p1.d = 'hcd;
      p1.e = 'h1234_5678;
      //p1.name = "Ankita";
      $display("Entities: %p", p1);
      $display("value of a = %0h", p1.a);
      $display("value of b = %0d", p1.b);
      $display("value of c = %0h", p1.c);
      $display("value of d = %0h", p1.d);
      $display("e = %h", p1.e);
    end
endmodule
      
  