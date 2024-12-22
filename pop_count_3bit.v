module pop_count_3bit( 
    input [2:0] in,
    output [1:0] out );
//genvar i;
    generate
        always @(*)
            begin
                out =2'b00;
                for(int i=0; i<3; i++)
                    begin
                    if(in[i] ==1'b1)
                        out=out+1;
                    else
                        out=out;
                    end
            end
    endgenerate
endmodule
