module pop_count_1
( 
    input [254:0] in,
    output [7:0] out );
genvar i;
    generate
        always @(*) 
            begin
         out =8'b00000000;
         for(int i=0; i<255; i++)
             begin
            if (in[i]==1'b1)
            out=out+1;
                 else
                     out=out;
            end
        end
    endgenerate
endmodule
