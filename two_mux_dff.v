module two_mux (
    input clk,
    input w, R, E, L,
    output Q
);
    wire [1:0]t;
    assign t={E,L};
    always @(posedge clk)
        begin :ayush
            case(t)
            2'b00:  Q <= Q;  
            2'b01:  Q <= R; 
            2'b10:  Q <= w; 
            2'b11:  Q <= R;
             endcase
        end :ayush
endmodule
