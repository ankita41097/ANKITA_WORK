module queue;  
  int q[$];
  int popped_elem;
  
  initial
    begin
    
    q.push_back(10);    //adding elements from front
    q.push_back(20);
    q.push_back(30);  
    $display("Queue after push back: %p", q);
    q.push_front(5);    
    $display("Queue after push front: %p", q);
    $display("Element at index 2: %0d", q[2]);
    popped_elem = q.pop_back();
    $display("Removed element from back: %0d", popped_elem);
    $display("Queue after pop back: %p", q);
    popped_elem = q.pop_front();
    $display("Removed element from front: %0d", popped_elem);
    $display("Queue after pop_front: %p", q);
    $display("Size of queue: %0d", q.size());
    q.delete(0);
    $display("Queue after deleting index 0: %p", q);
    end
endmodule

module queue_2d;
  int q[$][$];
  
    initial begin
      
      q.push_back('{1, 2, 3});
      q.push_back('{4, 5, 6});
      $display("2D Queue: %p", q);
      $display("Element at q[1][2]: %0d", q[1][2]);
      q.pop_back();
      $display("2D Queue after pop_back: %p", q);
      q.push_front('{7, 8, 9});
      $display("2D Queue after push_front: %p", q);
      $display("Size of queue: %0d", q.size());
      q.delete(0);
      $display("2D Queue after deleting index 0: %p", q);
    end
endmodule

module queue3d();
  int queue_arr[$][$][$] = '{'{'{1,2,3},'{4,5,6}},'{'{7,8,9},'{10,11,12}}};
  //int queue_arr[$][$][$];
  initial
    begin
      $display("Queue index queue_arr[1][0]: %0p", queue_arr[1][0]);
      $display("Queue index queue_arr[0][0]: %0p", queue_arr[0][0]);
      $display("Queue index queue_arr[0][1]: %0p", queue_arr[0][1]);
      $display("element of queue_arr[0][0][1]", queue_arr[0][0][1]);
      $display("Queue : %0p", queue_arr);
          
      queue_arr[0][1].pop_front();
      $display("Queue1: %0p", queue_arr);
      
      queue_arr[0].push_back('{21, 22, 23}); 
      $display("Queue2: %0p", queue_arr);
      
      queue_arr[1].push_front('{31,41,51});
      $display("Modified3 Queue: %0p", queue_arr);
      
      queue_arr[0][0].pop_back();
      $display("Modified4 Queue: %0p", queue_arr);    
      $display("size of Queue: %0d", queue_arr.size());
       
          
      queue_arr[0].insert(0,{4,4,4});
      $display("Modified4 Queue: %0p", queue_arr);
      
      queue_arr[0][0].delete(0);
      $display("Modified deleted Queue: %0p", queue_arr);
    end
endmodule

