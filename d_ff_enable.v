module d_ff_enable (
    input d, 
    input ena,
    output q);
    always @(*) 
        begin
            if(ena)
                q<=d;
        end
endmodule
