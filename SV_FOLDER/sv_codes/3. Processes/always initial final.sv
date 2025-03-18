module tb();
  reg clk, reset;
  logic [3:0] data_in;
  wire parity;
  
  assign parity = ^data_in;
  
  initial begin: clk_gen
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial begin: reset_signal
      reset = 1;
      #10;
      reset = 0;
    end
  
  initial begin: data_input
      data_in = 4'b0000;
      #15;
      data_in = 4'b1101;
      #20;
      data_in = 'b1011;
      #35;
      data_in = 'b1110;
      #100; $finish;
    end
  
  initial begin: data_monitoring 
    $monitor ("Data Monitoring: Time: %0t, clk: %0b, reset:%0b, data_in: %0b, parity: %0b", $time, clk, reset, data_in, parity);
    end
  
  always begin: Incremented_data
    @(posedge clk)
    begin
      if(reset)
        data_in <= 4'b0000;
      else
        data_in <= data_in + 1;
      $display("Incremented data: Data_in: %0b, Reset: %0b, clk: %0b", data_in, reset, clk);
    end
  end
  
  always begin: monitor_data 
    @(data_in)
    begin
      $display("Monitor Data: Time %0t: Data changed to %0b, Parity=%0b", $time, data_in, parity);
    end
  end
  
  always begin: monitor_combined
    @(data_in or parity)
    begin
      $display("Monitor combined: Time %0t: Signal changed - Data=%0b, Parity=%0b", $time, data_in, parity);
    end
  end
  
  always begin: monitor_clock_reset 
      @(posedge clk or posedge reset)
      begin
        if (reset)
          $display("Monitor clock reset: Time %0t: Reset detected during clock edge", $time);
      else
        $display("Time %0t: Rising clock edge with reset inactive", $time);
    end
  end
  
  final begin: finalize_sim 
    $display("Final Simulation Time: Time %0t: Simulation finished", $time);
  end
  
  final begin: finalize_summary
    $display("Final Simulation Summary: Data=%0b, Final Parity=%0b", data_in, parity);
  end
endmodule
    