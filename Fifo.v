module Fifo  // Synchronous
(
input clk,rst, wr_en, rd_en,
input           [7:0] buf_in,
output reg      [7:0] buf_out,
output reg      [7:0] fifo_counter,
output reg      buf_empty,buf_full  
);

reg [3:0] tail, head;

reg buf_mem[63:0];



/////////////////////////////////////
//////// first_always_block ////////       // For initializing fifo_counter
///////////////////////////////////

always @(fifo_counter)
begin

     buf_empty = (fifo_counter==0);     // counter should be at 0 if fifo is empty
     buf_full = (fifo_counter==64);    // counter should be at 64 if fifo is filled till 63

end



/////////////////////////////////////
//////// second_always_block ///////     // What to do with fifo_counter wrt empty,full,wr_en and rd_en
///////////////////////////////////

always @(posedge clk or posedge rst)
begin

if(rst)                                                  // if doing reset
     fifo_counter <= 0;                                 // counter at 0

else if((!buf_full && wr_en) && (!buf_empty && rd_en)) // we are doing both reading and writing and fifo neither full nor empty
     fifo_counter <= fifo_counter;                    // counter at counter

else if(!buf_full && wr_en)                          // fifo is not full and we are doing writing
     fifo_counter <= fifo_counter + 1;              // increase counter by 1

else if(!buf_empty && rd_en)                       // fifo is not full and we are doing reading
     fifo_counter <= fifo_counter - 1;            // decrease counter by 1

else                                             // all other cases
     fifo_counter <= fifo_counter;              // counter at counter
end



/////////////////////////////////////
//////// third_always_block ////////      // For reading the data from the FIFO
///////////////////////////////////

always @(posedge clk or posedge rst)
begin

if(rst)
     buf_out <= 0;

else
begin

if(!buf_empty && rd_en)
         buf_out <= buf_mem [tail];  // Fetching the data from different differenmt locations of Tail  
else       
         buf_out <= buf_out;
end
end



/////////////////////////////////////
//////// fourth_always_block ///////  // For writing the data from the FIFO
///////////////////////////////////

always @(posedge clk or posedge rst)
begin

if(!buf_full && wr_en)
         buf_mem[head] <= buf_in ;  // Storing the data into different differenmt locations of Head
else
         buf_mem[head] <= buf_mem[head];
end



/////////////////////////////////////
//////// fifth_always_block  ///////  // For writing the data from the FIFO
///////////////////////////////////

always @(posedge clk or posedge rst)
begin

if(rst)
begin
         head=0;
         tail=0;
end

else
begin
         if(!buf_full && wr_en)
               head <= head+1;
         else
               head <= head; 
         if(!buf_empty && rd_en)
               tail <= tail+1;
         else
               tail <= tail;

end

end

endmodule