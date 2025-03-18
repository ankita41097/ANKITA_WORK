// Code your design here
module fifo_queue #(parameter WIDTH = 8, parameter DEPTH = 16) (
    input logic clk,
    input logic reset,
    input logic write_en,
    input logic read_en,
    input logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out,
    output logic full,
    output logic empty
);

    // Declare queue
    logic [WIDTH-1:0] queue[$];

    // Always block for FIFO write operation
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            queue = {}; // Clear the queue
        end else if (write_en && !full) begin
            queue.push_back(data_in); // Write to FIFO
        end
      
    end
  

    // Always block for    FIFO read operation
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= '0; // Reset data_out
        end else if (read_en && !empty) begin
            data_out <= queue.pop_front(); // Read from FIFO
          $display("design Read data: %0d", data_out);
        end
      //$display("Read data: %0d", data_out);
    end
  // Status signals
      always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            full<=0;
            empty<=0;
        end else if (queue.size() == DEPTH) begin
            full<=1;
        end else if (queue.size() == DEPTH-1) begin
            full<=0;
        end else if(queue.size() == 0)begin
          empty<=1;
        end
      
    end
endmodule

////////////////////////////////////////////////////////////////////////////////////////

module fifo_queue_tb;

    // Parameters
    parameter WIDTH = 8;
    parameter DEPTH = 16;

    // Signals
    logic clk;
    logic reset;
    logic write_en;
    logic read_en;
    logic [WIDTH-1:0] data_in;
    logic [WIDTH-1:0] data_out;
    logic full;
    logic empty;

    // Instantiate FIFO
    fifo_queue #(WIDTH, DEPTH) fifo_inst (
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        write_en = 0;
        read_en = 0;
        data_in = '0;

        // Reset
        #10;
        reset = 0;

        // Write data into the FIFO
      for (int i = 0; i < 16; i++) begin
            @(posedge clk);
            write_en = 1;
            data_in = i + 1; // Write values 1 to 10
          $display("write data: %0d", data_in);
        end
        @(posedge clk);
        write_en = 0;

        // Read data from the FIFO
      for (int i = 0; i < 16; i++) begin
            @(posedge clk);
            read_en = 1;
          //  @(posedge clk);
          //  $display("Read data: %0d", data_out);
        end
      @(posedge clk);
        read_en = 0;

        // End simulation
        #20;
        $finish;
    end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
endmodule

