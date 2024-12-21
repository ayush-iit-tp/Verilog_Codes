reg [3:0] random_value;
initial begin
    random_value = $random(7); // Seed the generator
    forever #20 random_value = $random; // Generate a new random value every 20 time units
end
