module thermostat(
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);
assign heater =mode &too_cold;
    assign aircon =too_hot&~(mode) ;
    assign fan =fan_on |(mode&too_cold)|(too_hot&~(mode));
endmodule
