// Baud Rate Generator Module
module baud_rate_generator (
    input wire clock,        // System clock
    input wire reset,        // Reset signal
    output reg baud_tick     // Baud rate clock enable
);

    parameter BAUD_DIVISOR = 10416; // Example: For 9600 baud @ 100 MHz clock
    reg [13:0] counter;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 0;
            baud_tick <= 0;
        end else begin
            if (counter == BAUD_DIVISOR / 2 - 1) begin
                baud_tick <= ~baud_tick;
                counter <= 0;
            end else
                counter <= counter + 1;
        end
    end
endmodule
