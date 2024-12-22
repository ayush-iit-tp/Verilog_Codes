module n_bit_comparator #(parameter N=4)(a, b,enable ,aisbig, bisbig, equal);

input [N-1:0] a, b;
input enable;
output reg aisbig, bisbig, equal;
reg done;
reg enable1;
integer i;

always @(a, b) begin
    aisbig = 1'b0;
    bisbig = 1'b0;
    equal = 1'b0;
    done = 1'b0;
    enable1=enable;	
    for (i = N-1; i >= 0 && done == 0 && enable1==1; i = i - 1) begin
        if (a[i] > b[i]) begin
            aisbig = 1'b1;
            bisbig = 1'b0;
            equal = 1'b0;
            done = 1'b1;
        end else if (a[i] < b[i]) begin
            aisbig = 1'b0;
            bisbig = 1'b1;
            equal = 1'b0;
            done = 1'b1;
        end
	else if(a[i]==b[i] && i==0) begin
	equal=1'b1;
	done=1'b1;
	end
    end
end

endmodule

