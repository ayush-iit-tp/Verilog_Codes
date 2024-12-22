//TB for countones

module TB_find_ones#(parameter N=9) ();

reg [N-1:0]a;// declared as inputs // declared as output
wire number;

//callling module count_ones
find_ones t(.a(a),.number(number));

initial
begin 
            a[0]=1'b1;a[1]=1'b1; a[2]=1'b0; a[3]=1'b1;a[4]=1'b1;a[5]=1'b1; a[6]=1'b0; a[7]=1'b1;a[8]=1'b1;
      #100 a[0]=1'b0;a[1]=1'b1; a[2]=1'b0; a[3]=1'b1;a[4]=1'b1;a[5]=1'b1; a[6]=1'b0; a[7]=1'b1;a[8]=1'b1;
      #100 a[0]=1'b1;a[1]=1'b0; a[2]=1'b0; a[3]=1'b1;a[4]=1'b1;a[5]=1'b1; a[6]=1'b0; a[7]=1'b1;a[8]=1'b1;
      #100 a[0]=1'b1;a[1]=1'b1; a[2]=1'b1; a[3]=1'b1;a[4]=1'b1;a[5]=1'b1; a[6]=1'b0; a[7]=1'b1;a[8]=1'b1;
      #100 a[0]=1'b1;a[1]=1'b1; a[2]=1'b1; a[3]=1'b0;a[4]=1'b1;a[5]=1'b1; a[6]=1'b0; a[7]=1'b1;a[8]=1'b1;

end
endmodule