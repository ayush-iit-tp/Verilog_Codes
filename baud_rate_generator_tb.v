// UART Baud Rate Generator Testbench
module baud_rate_generator_tb();
    reg clock, reset;
    wire baud_tick;

    baud_rate_generator uut (.clock(clock), .reset(reset), .baud_tick(baud_tick));

    always #5 clock = ~clock; // 100 MHz clock

    initial begin
        clock = 0;
        reset = 1;
        #10 reset = 0;
        #500 $finish;
    end
endmodule
