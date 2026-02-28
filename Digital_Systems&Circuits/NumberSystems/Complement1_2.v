module ones_complement;

  reg  [7:0] in;
  reg  [7:0] two;
  reg [7:0] one;

  initial begin
    in  = 8'b10101010;   // example input
    one = ~in;           // 1's complement (invert all bits)
    two= one+1;
  end

endmodule
