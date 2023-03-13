module slow_clock_counter(
    input clk,
    input [4:0] btn,
    output [4:0] led
);

wire rst = ~btn[1];

reg s_clk;
reg [31:0] clk_counter;
reg [3:0] counter;

assign led[4] = 1'b0;
assign led[3:0] = counter;


always @(posedge s_clk or posedge rst) begin
    if (rst == 1'b1) begin
        counter <= 4'b0000;
    end else begin
        counter <= counter + 1'b1;
    end
end


//WARNING this is not a good clock divider (it is for learning purposes)
always @(posedge clk or posedge rst) begin
    if(rst) begin
        clk_counter <= 32'b0;
    end else if (clk_counter == 50000000) begin
        clk_counter <= 32'b0;
        s_clk <= ~s_clk;
    end else begin
        clk_counter <= clk_counter + 1; 
    end
end


endmodule