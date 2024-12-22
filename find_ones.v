//programm to find number of ones in a binary string

module find_ones #(parameter  N= 9)(a,number);
input [N-1:0] a;
reg count;
output number;
integer i;
always @(a) begin
    count=1'b0;
    for(i=0;i<N;i=i+1)begin
        if(a[i]==1'b1)begin
            count=count+1;
            number=count;
    end
end
end

endmodule
