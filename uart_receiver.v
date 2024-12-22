// UART Receiver Module
module uart_receiver (
    input wire       clock,        // System clock
    input wire       rxd,          // Serial data input
    input wire       baud_tick,    // Baud rate clock enable
    output reg [7:0] rx_DATA,         // Parallel data output
    output reg       rx_done       // Reception complete
);

    localparam IDLE  = 3'b000;
    localparam START = 3'b001;
    localparam DATA  = 3'b010;
    localparam STOP  = 3'b011;

    reg [2:0] state;
    reg [3:0] bit_counter;
    reg [7:0] data_buffer;

    always @(posedge clock) begin
        if (baud_tick) begin
            case (state)
                IDLE: begin
                    rx_done <= 0;
                    if (!rxd) state <= START; // Detect start bit (low)
                end

                START: state <= DATA;

                DATA: begin
                    data_buffer[bit_counter] <= rxd;
                    if (bit_counter < 7)
                        bit_counter <= bit_counter + 1;
                    else
                        state <= STOP;
                end

                STOP: begin
                    if (rxd) begin // Stop bit must be high
                        rx_DATA <= data_buffer;
                        rx_done <= 1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule