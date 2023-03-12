module and_gate(
    input [1:0] btn,

    output [4:0] led  
);

    assign led[0] = !(btn[0] || btn[1]); 

endmodule