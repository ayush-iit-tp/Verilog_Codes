module single_port_ram (
    input [7:0] data,       // Input data (8-bit)
    input [5:0] addr,       // Address (6-bit for 64 locations)
    input we,               // Write Enable
    input clk,              // Clock
    output reg [7:0] q      // Output data (8-bit)
);

    reg [7:0] ram [63:0];   // 64 x 8-bit memory
    reg [5:0] addr_reg;     // Address register

    always @(posedge clk) begin
             addr_reg <= addr;    // Store the address in addr_reg
               if (we)
                   begin             // If Write Enable is active
              ram[addr] <= data;// Write data to the memory at the given address
                    end
        else
        begin
                
           q <= ram[addr_reg]; // Else, read data from memory
            end
end 
endmodule