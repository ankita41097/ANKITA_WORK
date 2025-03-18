module struct_packed_signed;

    // Define a packed struct
    typedef struct packed {
        logic [3:0] nibble; // 4 bits
        logic [3:0] bytes;   // 4 bits
    } packed_struct_t;

    // Define a signed packed struct
    typedef struct packed signed {
        logic [3:0] nibble; // 4 bits
        logic [3:0] bytes;   // 4 bits
    } signed_struct_t;

    // Declare struct variables
    packed_struct_t p_struct;
    signed_struct_t s_struct;

    initial begin
        // Assign simple values to both structs
        p_struct = 8'b01100100; // Combined binary value for nibble and byte
        s_struct = 8'b11100100; // Combined binary value (MSB is 1 for signed)

        // Display the raw binary and interpreted values
        $display("Packed Struct (unsigned): %b, Value:%0d",p_struct,p_struct);
        $display("Signed Struct: %b, Value: %0d", s_struct,$signed(s_struct));

        // Assign a signed negative value explicitly
        s_struct = -12; // Assign a signed value
        $display("Signed Struct with Negative Value: %b, Value: %0d",s_struct, $signed(s_struct));
    end

endmodule