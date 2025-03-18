module assertion_functions;

  reg clk, reset;
  reg [2:0] a1;  //onehot
  reg a, b;      //rose and fell
  reg [3:0] a2;  //stable
  reg [3:0] a3;  //past
  reg a4;

  //  $onehot() - Ensure signal has only 1 bit set at a time
  property onehot_check;
    @(posedge clk) disable iff (reset) $onehot(a1);
  endproperty
  assrt1: assert property (onehot_check)
    $info("%t assertion one-hot passed",$realtime);
  else
    $error("%t assertion onehot failed",$realtime);

  //  $stable() - Check if a signal remains constant
  property stable_check;
    @(posedge clk) disable iff (reset) $stable(a2);
  endproperty
   assrt2: assert property (stable_check)
      $info("%t assertion stable passed.",$realtime);
  else
    $error("assertion stable failed. Signal changed",$realtime);

  //  $fell() - Detect falling edge of signal_a
  property fell_check;
    @(posedge clk) disable iff (reset) $fell(a);
  endproperty    
  assrt3: assert property (fell_check)
    $info("%t assertion fell_check passed",$realtime);
  else
    $error("%t assertion fell_check failed. Signal didnot fall",$realtime);

  //  $rose() - Detect rising edge of signal_b
  property rose_check;
    @(posedge clk) disable iff (reset) $rose(b);
  endproperty
   assrt4: assert property (rose_check)
      $info("%t assertion rose_check passed",$realtime);
  else
    $error("%t assertion rose_check failed. Signal didnot rise",$realtime);

  //  $changed() - Check if a signal has changed from the last cycle
  property changed_check;
    @(posedge clk) disable iff (reset) $changed(a3);  
  endproperty                                          
  assrt5: assert property (changed_check)
    $info("%t assertion changed_check passed",$realtime);
  else
    $error("%t assertion changed_check failed. Signal did not change",$realtime);

  //  Ensure signal actually changed compared to its past value
//   property check_actual_change;
//     @(posedge clk) disable iff (reset) a3 != $past(a3);
//   endproperty
//   assert property (check_actual_change)
//     $info("Signal actually changed.");
//   else
//     $error("No actual change detected!");

  //  $past() - Ensure current value is related to past value
  property check_past_value;
    @(posedge clk) disable iff (reset) a3 == $past(a3, 1);
//     @(posedge clk) disable iff (reset) $past(a3, 1);
  endproperty
  assrt6: assert property (check_past_value)
    $info("%t Past value check passed",$realtime);
  else
    $error("%t Past value does not match",$realtime);

  //  $isunknown() - Ensure the signal is never X or Z
  property unknown_check;
    @(posedge clk) disable iff (reset) !$isunknown(a4);
  endproperty
    assrt7: assert property (unknown_check)
      $info("%t No unknown state detected",$realtime);
  else
    $error("%t Unknown (X/Z) state detected",$realtime);

  //  Ensure unknown_signal becomes a known value at some point
  property check_known_value;
    @(posedge clk) disable iff (reset) $past($isunknown(a4)) |-> !$isunknown(a4);
  endproperty
  assrt8: assert property (check_known_value)
    $info("%t Unknown value resolved",$realtime);
  else
    $error("%t Signal remains unknown!",$realtime);

     
    // Clock Generation
    always #5 clk = ~clk;
  
    // Reset Generation
    initial begin
      clk = 0;
      reset = 1;
      #10 reset = 0;
    end
  
    // Stimulus for signals
//     initial begin
//      a1 = 3'b001;
//       a = 0; b = 0;
//       a2 = 4'b1010;
//       a3= 4'b0101;
//       unknown_signal = 1'bx;
//       #15 a1 = 3'b010;
//       #10 a = 1;
//       #10 b = 1;
//       #10 a2 = 4'b1010;  // No change
//       #10 a3 = 4'b0110;
//       #10 unknown_signal = 1'b0;
//     end
    
    initial begin
      repeat(20) begin
        #10;
        std::randomize(a, b, a1, a2, a3, a4);
        $display("a:%0d, b:%0d, a1:%0d, a2:%0d, a3:%0d, a4:%0d", a, b, a1, a2, a3, a4);
      end
    end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #300 $finish(); 
    end
endmodule
