module button_counter(
    input [1:0] btn,
    output reg [3:0] led
);

    //Reversing buttons as they are active low
    //Buttons are not de-bounced in hardware
    wire rst = !btn[1];
    wire clk = !btn[0];

    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            led <= 4'b0000;
        end else begin
            led <= led + 1'b1;
        end
    end


endmodule