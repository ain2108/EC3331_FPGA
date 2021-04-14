module counter (

    // 1.
    // wire is a wire hehe. What this means is it cannot store value
    // and therefore you cannot write to a wire. You can however connect
    // wires together.
    input wire clk,    // clock signal
    input wire rst,  // reset signal 

    // 2. 
    // This output is coming from a register. You can think of it, in this case, 
    // as 8 flip flops each storing a bit. Thus you can indeed write into registers
    // on every clock cycle.
    output reg [7:0] out     // module's output signal
);

    // 3.
    // Always block gets executed whenever the signals in its "sensitivity" list change
    always @(posedge clk or posedge rst) begin
        // 4.
        // This looks like an if statement from Python ... it is not!
        // Think how would you make an if statement in hardware.
        if (rst) begin
            out <= 0; // reset the counter on reset by writing 0
        end else begin
            out <= out + 1; // write the current value of the counter plus 1 into the counter
        end
    end

endmodule // counter