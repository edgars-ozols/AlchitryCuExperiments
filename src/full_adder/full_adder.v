module full_adder(
    input [2:0] btn,
    output [4:0] led
); 
    assign led[4:2] = 3'b000;

    wire a = !btn[0];
    wire b = !btn[1];
    wire cin = !btn[2];

    wire s = led[0];
    wire cout = led[1];

    wire first_xor;
    assign first_xor = a ^ b;
    assign s = first_xor ^ cin;

    assign cout = (first_xor & cin) | (a & b);

endmodule