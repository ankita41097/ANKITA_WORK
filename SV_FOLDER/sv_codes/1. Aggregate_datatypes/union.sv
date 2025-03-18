module tb_union;  
  typedef union {
    bit [7:0] data;     
    logic [31:0] addr;         
    real r;
  } pkt;
    pkt p1;
  
  initial 
    begin
      p1.data = 8'hde;
      $display("data: %h", p1.data);  
      p1.addr = 32'h4532deff;
      $display("addr: %h", p1.addr);
      p1.r = 5.9753;
      $display("float r: %f", p1.r);
    
      $display("uni : %p",p1);
    
      $display("data: %h", p1.data);
      $display("addr: %h", p1.addr);
      $display("float r: %f", p1.r);
    end
endmodule
    
// module test();
//   union {bit [7:0] a,b,c; int x;} u1;
//   initial
//   begin
//     u1.a=23;
//     u1.b=25;
//     u1.c=22;
//     u1.x=20;
//     $display(" u1.a :%0d",u1.a);
//     $display("u1.b :%0d",u1.b);
//     $display("u1.c :%0d",u1.c);
//     $display(" u1.d :%0d",u1.x);
        
//   end
// endmodule

// module test2();
//   union tagged {bit [7:0] a,b,c; int x;} u1;
  
//   initial
//   begin
//     u1=tagged a(7);
//     $display(" u1.a  : %0d",u1.a);
//     u1=tagged b(17);
//     $display(" u1.b  : %0d",u1.b);
//     u1=tagged c(27);
//     $display(" u1.c  : %0d",u1.c);
//     u1=tagged x(37);
//     $display(" u1.x  : %0d",u1.x);
//   end
// endmodule

module union_packed;
  typedef union packed {
    bit [31:0] word;
    struct packed{
      bit [23:0] fraction;
      bit [7:0] exponent;
    } floatview;
  } myunion;
  myunion u1;
  
  initial
    begin
      u1.word = 32'h4532deff;
      $display("word: %h", u1.word);
      $display("Fraction: %h, Exponent: %h", u1.floatview.fraction, u1.floatview.exponent);
    end
endmodule

module test2;
  typedef union tagged {
    bit [7:0] a,b,c; 
    int x;
  } u;
  u u1,u2;
  
  initial
    begin
      u1=tagged a(7);
      $display(" u1.a  : %d",u1.a);
      $display(" u1.a  : %d",u1.b);
      u1=tagged b(17);
      $display(" u1.b  : %d",u1.b);
      //$display(" u1.a  : %d",u1.a);
      u1=tagged c(27);
      $display(" u1.c  : %d",u1.c);
      u1=tagged x(7221);
      $display(" u1.x  : %d",u1.x);
      $display("the data type of name is : %s",$typename(u)); 
    end
endmodule
