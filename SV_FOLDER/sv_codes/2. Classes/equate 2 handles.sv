class trans;
  int data;
  
  function new(int val = 0);
    data = val;
  endfunction
  
  function void display();
    $display("data: %d", data);
  endfunction
endclass

module test_trans;
  
  initial begin
    trans t1;
    trans t2; 

    t1 = new(10);
    $display("After creating t1:");
    t1.display();
    t2 = t1;
    $display("After equating t2 to t1:");
    t2.display();        
    t2.data = 20;

    $display("After modifying data through obj2:");
    t1.display(); // t1 reflects the change
    t2.display();  
  end
endmodule























class account_c;
  int balance;				//declare properties
  
  function int summary();		//declare methods function and task
    return balance;
  endfunction
  
  task deposit(int pay);
    balance = balance + pay;
  endtask
endclass

module top;
  account_c acnth1;
  account_c acnth2;
  initial begin
    acnth1 = new();
    acnth1.balance = 500;   //initialize the balance with 500
    $display("Current balance = %d",acnth1.balance);
    acnth1.deposit(1000);
    $display("The account summary is = %0d", acnth1.summary);
    $display("The account balance is = %0d", acnth1.balance);
	
    acnth2 = acnth1;
    $display("The account balance and summary in acnth2 = %0d and %0d", acnth2.summary, acnth2.balance);
    
    acnth2.balance = 2500;
    $display("Current balance = %d",acnth2.balance);
    $display("Current balance = %d",acnth1.balance);
  end
endmodule