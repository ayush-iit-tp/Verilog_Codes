module Asynch_Fifo (
    input wr_clk, rd_clk, rst,           // Separate write and read clocks, and a reset signal
    input wr_en, rd_en,                 // Write and read enable signals
    input [7:0] buf_in,                // Input data to write to FIFO
    output reg [7:0] buf_out,         // Output data read from FIFO
    output reg buf_empty, buf_full   // Flags to indicate empty and full status of FIFO
);

  ///////////////////////////////////
 /////////     Parameters   ////////                 
///////////////////////////////////
parameter DEPTH = 64;                   // Depth of the FIFO (number of entries)
parameter ADDR_WIDTH = 6;              // Width of the address pointers (Log2(DEPTH))

  /////////////////////////////////////
 ///////// Memory for FIFO ///////////
/////////////////////////////////////
reg [7:0] buf_mem [0:DEPTH-1];     // Dual-port memory to store FIFO data

  ///////////////////////////////////////////////
 ///// Write and Read Pointers (Gray-coded) ////
///////////////////////////////////////////////
reg [ADDR_WIDTH:0] head, tail;                            // Binary write and read pointers
reg [ADDR_WIDTH:0] head_gray, tail_gray;                 // Gray-coded pointers for synchronization

// Synchronizer Registers
reg [ADDR_WIDTH:0] head_gray_sync1, head_gray_sync2;   // Synchronized write pointer in read domain
reg [ADDR_WIDTH:0] tail_gray_sync1, tail_gray_sync2;  // Synchronized read pointer in write domain

  /////////////////////////////////////
 //////// Empty and Full Flags ///////          
/////////////////////////////////////
// Flags derived from synchronized pointers
wire empty_flag;
wire full_flag;

assign empty_flag = (head_gray_sync2 == tail_gray);                                                 
assign full_flag  = (head_gray == {~tail_gray_sync2[ADDR_WIDTH], tail_gray_sync2[ADDR_WIDTH-1:0]}); 

  ///////////////////////////////////////////////////
 ///// Write Pointer Update Logic with Gray Code ///
///////////////////////////////////////////////////
always @(posedge wr_clk or posedge rst) begin
    if (rst) begin
        head <= 0;                        // Reset write pointer to 0
        head_gray <= 0;                   // Reset Gray-coded write pointer
    end 
    else if (wr_en && !buf_full) begin    // Write only if enabled and not full
        buf_mem[head[ADDR_WIDTH-1:0]] <= buf_in;  // Write data into memory
        head <= head + 1;                          // Increment binary write pointer
        head_gray <= (head + 1) ^ ((head + 1) >> 1); // Convert binary to Gray code
    end
end

  ////////////////////////////////////////////////////
 ///// Read Pointer Update Logic with Gray Code ////
////////////////////////////////////////////////////
always @(posedge rd_clk or posedge rst) begin
    if (rst) begin
        tail <= 0;                       // Reset read pointer to 0
        tail_gray <= 0;                  // Reset Gray-coded read pointer
    end 
    else if (rd_en && !buf_empty) begin  // Read only if enabled and not empty
        buf_out <= buf_mem[tail[ADDR_WIDTH-1:0]];   // Read data from memory
        tail <= tail + 1;                          // Increment binary read pointer
        tail_gray <= (tail + 1) ^ ((tail + 1) >> 1); // Convert binary to Gray code
    end
end

  ////////////////////////////////////////////////////////
 ///// Synchronize Read Pointer to Write Clock Domain ///
////////////////////////////////////////////////////////
always @(posedge wr_clk or posedge rst) begin
    if (rst) begin
        tail_gray_sync1 <= 0;   // Reset first stage synchronizer
        tail_gray_sync2 <= 0;   // Reset second stage synchronizer
    end 
    else begin
        tail_gray_sync1 <= tail_gray;       // First stage: Capture read pointer (Gray)
        tail_gray_sync2 <= tail_gray_sync1; // Second stage: Synchronize to write clock
    end
end

  ////////////////////////////////////////////////////////////
 ////// Synchronize Write Pointer to Read Clock Domain //////
////////////////////////////////////////////////////////////
always @(posedge rd_clk or posedge rst) begin
    if (rst) begin
        head_gray_sync1 <= 0;  // Reset first stage synchronizer
        head_gray_sync2 <= 0;  // Reset second stage synchronizer
    end 
    else begin
        head_gray_sync1 <= head_gray;       // First stage: Capture write pointer (Gray)
        head_gray_sync2 <= head_gray_sync1; // Second stage: Synchronize to read clock
    end
end

  ////////////////////////////////////////////////////////////
 /////// Update Empty Flag Based on Synchronized Pointers ///
////////////////////////////////////////////////////////////
always @(posedge rd_clk or posedge rst) begin
    if (rst) 
        buf_empty <= 1;           // FIFO is empty after reset
    else 
        buf_empty <= empty_flag;  // Update empty flag
end

  /////////////////////////////////////////////////////////
 ///// Update Full Flag Based on Synchronized Pointers ///
/////////////////////////////////////////////////////////
always @(posedge wr_clk or posedge rst) begin
    if (rst) 
        buf_full <= 0;           // FIFO is not full after reset
    else 
        buf_full <= full_flag;   // Update full flag
end

endmodule

