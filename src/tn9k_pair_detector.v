//File Title: Digital Design - Pair Detector
//GOWIN Version: 1.9.8.01
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C

module pair_detector(
    input stream,
    input sys_clk,

    output reg out
    );

reg [1:0] pair;

always @(negedge sys_clk) begin
    pair[0] <= stream;
    pair[1] <= pair[0];
end

always @(negedge sys_clk) begin
    if(pair[0] == pair[1]) begin
        out <= 0;
    end
    else begin
        out <= 1;
    end
end
endmodule