module tb_struct;
    typedef struct {
        int id;       
        string name;  
        real ann_leave;
    } Employee;

    Employee emp;

    initial 
      begin
        emp.id = 305;
        emp.name = "Ankita";
        emp.ann_leave = 5.25;

        $display("Employees details");
        $display("ID: %0d", emp.id);
        $display("Name: %s", emp.name);
        $display("Annual leaves: %0f", emp.ann_leave);
    end
endmodule

module tb();
  struct {
    bit[7:0] x,y,z;} coordinates; 
  
  initial
    begin
      coordinates='{10,14,12};
      $display("the data inside the struct data type coordinate : %p",coordinates);
    end
endmodule


module test();
  typedef struct {
    int a;
    int b;
  } sides1;
  
  typedef struct {
    string name;
    sides1 length;  //struct inside struct 
    int id;
  } entity1;

  entity1 entity;

  initial begin
    entity.name = "Ankita";
    entity.length.a = 5;
    entity.length.b = 20;
    entity.id = 101;

    $display("Entity Name: %s", entity.name);
    $display("Length: (a=%0d, b=%0d)", entity.length.a, entity.length.b);
    $display("Entity ID: %0d", entity.id);
    $display("%p",entity);
  end
endmodule

module tb_union;  
  typedef union {
        
    bit [7:0] data;     
    logic [31:0] addr;         
    real r;
  } pkt;
  
    pkt p1;
  
  initial begin
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
    
    $display("data: %h", p1.data);           
    $display("addr: %h", p1.addr);           
    $display("float r: %f", p1.r);   
   
  end
endmodule