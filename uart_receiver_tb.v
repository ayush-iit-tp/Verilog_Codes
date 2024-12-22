// UART Receiver Testbench
module uart_receiver_tb();
    reg clock, rxd;
    wire [7:0] rx_DATA;
    wire rx_done;
    reg baud_tick;

    uart_receiver uut (.clock(clock), .rxd(rxd), .baud_tick(baud_tick), .rx_DATA(rx_DATA), .rx_done(rx_done));

    always #5 clock = ~clock; // 100 MHz clock

    initial begin
        clock = 0;
        baud_tick = 0;
        rxd = 1; // Idle state

        // Simulate receiving a byte: Start bit, 8 data bits, stop bit
        #10 baud_tick = 1; rxd = 0; // Start bit
        repeat (8) begin
            #10 baud_tick = ~baud_tick; rxd = $random & 1; // Data bits
        end
        #10 baud_tick = ~baud_tick; rxd = 1; // Stop bit

        #50 if (rx_done) $display("Data Received: %b", rx_DATA);
        #100 $finish;
    end
endmodule