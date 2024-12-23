module dual_port_ram (
    input [7:0] data_a, data_b, // Input data for Port A and Port B
    input [5:0] addr_a, addr_b, // Address for Port A and Port B
    input we_a, we_b,           // Write Enable for Port A and Port B
    input clk,                  // Clock
    output reg [7:0] q_a, q_b   // Output data for Port A and Port B
);

    reg [7:0] ram [63:0];       // 64 x 8-bit memory
    reg [5:0] addr_reg_a, addr_reg_b; // Address registers for Port A and Port B

    // Port A
    always @(posedge clk) begin
        addr_reg_a <= addr_a;    // Store the address for Port A
        if (we_a)               // If Write Enable for Port A is active
            ram[addr_a] <= data_a; // Write data to memory for Port A
        else
            q_a <= ram[addr_reg_a]; // Else, read data from memory for Port A
    end

    // Port B
    always @(posedge clk) begin
        addr_reg_b <= addr_b;    // Store the address for Port B
        if (we_b)               // If Write Enable for Port B is active
            ram[addr_b] <= data_b; // Write data to memory for Port B
        else
            q_b <= ram[addr_reg_b]; // Else, read data from memory for Port B
    end

endmodule