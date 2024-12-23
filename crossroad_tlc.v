// Problem satetment:
// Traffic light should be installed in all 4 ways
// We are assuming directions as East,West,North and South
// Only one direction of traffic is allowed at a time
// RGY are three different colors
// Every light is set to be green for 30 Seconds
// Then Yellow for 5 Seconds
// Repeat the process for all the directions
// We are following this order for our code: North > West > South > East

module crossroad_tlc
(clk,rst,
north_light,
south_light,
east_light,
west_light,
);

input clk,rst;

output reg [2:0] north_light,south_light,east_light,west_light; 

reg [3:0] count;
reg [2:0] state;

parameter [2:0] north_green = 3'b000
,south_green = 3'b001
,east_green = 3'b010
,west_green = 3'b011
,north_yellow = 3'b100
,south_yellow = 3'b101
,east_yellow = 3'b110
,west_yellow = 3'b111;

/////////////////////////////////////
//////// first_always_block ////////       // For resetting and other cases related to directions
///////////////////////////////////

always @(posedge clk or posedge rst)
begin

          if(rst)                        // if rerset make state by default to north and counter should come to 0
begin
          state=north_green;
          count=4'b0000;
end

          else
begin
          case(state)
          north_green:
          begin
               if (count==4'b1111)        //This is similar for all next_green cases: north west east south: 4'b1111
               begin
               count = 4'b0000;           // Always when you get what you desire set count back to 0
               state = north_yellow;      // change now state to next state
               end

               else                         // The else part is also similar for all next cases
               begin 
               count = count+4'b0001;     // increase the count till it don't satisfy the if condition
               state = north_green;      // set the state back to itself
               end        
          end
          north_yellow:
          begin
               if (count==4'b0011)        //This is similar for all next_yellow cases: north west east south: 4'b0011
               begin
               count = 4'b0000;
               state = west_green;
               end

               else
               begin
               count = count+4'b0001;
               state = north_yellow;
               end        
          end

          west_green:
          begin
               if (count==4'b1111)
               begin
               count = 4'b0000;
               state = west_yellow;
               end

               else
               begin
               count = count+4'b0001;
               state = west_green;
               end        
          end
          west_yellow:
          begin
               if (count==4'b0011)
               begin
               count = 4'b0000;
               state = south_green;
               end

               else
               begin
               count = count+4'b0001;
               state = west_yellow;
               end        
          end

          south_green:
          begin
               if (count==4'b1111)
               begin
               count = 4'b0000;
               state = south_yellow;
               end

               else
               begin
               count = count+4'b0001;
               state = south_green;
               end        
          end
          south_yellow:
          begin
               if (count==4'b0011)
               begin
               count = 4'b0000;
               state = east_green;
               end

               else
               begin
               count = count+4'b0001;
               state = south_yellow;
               end        
          end

          east_green:
          begin
               if (count==4'b1111)
               begin
               count = 4'b0000;
               state = east_yellow;
               end

               else
               begin
               count = count+4'b0001;
               state = east_green;
               end        
          end
          east_yellow:
          begin
               if (count==4'b0011)
               begin
               count = 4'b0000;
               state = north_green;
               end

               else
               begin
               count = count+4'b0001;
               state = east_yellow;
               end        
          end
endcase
end
end

/////////////////////////////////////
/////// second_always_block ////////       // For Traffic light signal values
///////////////////////////////////

always @(state)
begin
              case(state)
              north_green:begin
              north_light = 3'b001;
              south_light = 3'b100;
              east_light = 3'b100;
              west_light = 3'b100;
end
              north_yellow:begin
              north_light = 3'b010;
              south_light = 3'b100;
              east_light = 3'b100;
              west_light = 3'b100;
end
              west_green:begin
              north_light = 3'b100;
              south_light = 3'b100;
              east_light = 3'b100;
              west_light = 3'b001;
end
              west_yellow:begin
              north_light = 3'b100;
              south_light = 3'b100;
              east_light = 3'b100;
              west_light = 3'b010;
end 
              south_green:begin
              north_light = 3'b100;
              south_light = 3'b001;
              east_light = 3'b100;
              west_light = 3'b100;
end
              south_yellow:begin
              north_light = 3'b100;
              south_light = 3'b010;
              east_light = 3'b100;
              west_light = 3'b100;
end 
              east_green:begin
              north_light = 3'b100;
              south_light = 3'b100;
              east_light = 3'b001;
              west_light = 3'b100;
end
              east_yellow:begin
              north_light = 3'b100;
              south_light = 3'b100;
              east_light = 3'b010;
              west_light = 3'b100;
end
  endcase                     
end

/////////////////////////////////////
//////// third_always_block ////////       // For 
///////////////////////////////////

//always @()
//begin


//end

endmodule