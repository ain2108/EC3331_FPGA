module counter_tb;
  
    reg reset = 0;
    reg clk = 0;
    wire [7:0] out;

    // This is how we can instantiate our counter module.
    // I think of it as attaching wires to ports of the module.
    counter c1 (.out(out), .clk(clk), .rst(reset));

    // This is an infinite loop. We need to generate a clock for
    // our device under test (DUT). This is simple way to do it.
    always begin
        #5 clk = !clk;
    end 

    initial begin
        # 17 reset = 1;
        # 11 reset = 0;
        # 29 reset = 1;
        # 11 reset = 0;
        # 100 $stop;
    end

    initial begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
    end

endmodule // test