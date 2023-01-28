//File Title: Digital Design - Pair Detector
//GOWIN Version: 1.9.8.01
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C

module pair_detector(
    input stream,
    input sys_clk,
    input sys_rst_n,
    output reg out
    );


reg [1:0] state;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) begin
        state <= 2'b00;
    end
    else begin
        case(state)
            2'b00:
                begin
                    if(stream == 0) begin
                        state <= 2'b01;
                    end
                    else begin
                        state <= 2'b10;
                    end
                    out <= 0;
                end
            2'b01:
                begin
                    if(stream == 0) begin
                        state <= 2'b11;
                    end
                    else begin
                        state <= 2'b10;
                    end
                    out <= 0;
                end
            2'b10:
                begin
                    if (stream == 0) begin
                        state <= 2'b01;
                    end
                    else begin
                        state <= 2'b11;
                    end
                    out <= 0;
                end
            2'b11:
                begin
                    if (stream == 0) begin
                        state <= 2'b01;
                    end
                    else begin
                        state <= 2'b10;
                    end
                    out <= 1;
                end
        endcase
    end
end

endmodule