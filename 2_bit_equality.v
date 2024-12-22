module 2_bit_equality(input [1:0] A, 
                   input [1:0] B, 
                   output z ); 
wire t1,t2,t3,t4;
    and(t1,~A[0],~A[1],~B[0],~B[1]);
    and(t2,~A[0],A[1],~B[0],B[1]);
    and(t3,A[0],~A[1],B[0],~B[1]);
    and(t4,A[0],A[1],B[0],B[1]);
    or(z,t1,t2,t3,t4);
endmodule
