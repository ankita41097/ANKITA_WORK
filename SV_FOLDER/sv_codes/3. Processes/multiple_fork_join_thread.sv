module fork_join_thread;
  initial
    begin
      #35 $display("[%0t] ---------thread 1------------", $time);
      fork
        begin:thread_1
          #10 $display("[%0t] Thread 1", $time);
          fork
            begin:thread_1c 
              #5 $display("[%0t] Thread 1c",$time);  
            end
            begin:thread_1a
              #20 $display("[%0t] Thread 1a", $time);
            end
            begin:thread_1b
              #30 $display("[%0t] Thread 1b-1",$time);
              #40 $display("[%0t] Thread 1b-2",$time);
            end
          join
        end
          
        begin:thread_2  
          #5 $display("[%0t] Thread 2",$time);    
          #20 $display("[%0t] Thread 2-1",$time);    
        end
          
        begin:thread_3
          fork
            begin
              #50 $display("[%0t] Thread 3",$time);
              fork
                begin:thread_4
                  #10 $display("[%0t] Thread 4-1",$time);
                  #15 $display("[%0t] Thread 4-2",$time);
                end
              join 
            end
          join  
        end
        
        begin:thread_5
          #25 $display("[%0t] Thread 5",$time);
        end
          
        begin:thread_7
          fork
            #50 $display("[%0t] Thread 7",$time);
            begin:thread_612
              #20 $display("[%0t] Thread 6-1",$time);
              #10 $display("[%0t] Thread 6-2",$time);
              begin:thread_6ab
                fork
                  #30 $display("[%0t] Thread 6-a",$time);
                  #35 $display("[%0t] Thread 6-b",$time);
                join             
              end
            end
          join
        end
      join
    end
endmodule