
module base_converter;

  // Function: char to integer value
  function automatic int char_to_val(byte ch);
    if (ch >= "0" && ch <= "9")
      return ch - "0";
    else if (ch >= "A" && ch <= "F")
      return ch - "A" + 10;
    else if (ch >= "a" && ch <= "f")
      return ch - "a" + 10;
    else
      return -1;
  endfunction


  // Convert from Q base to decimal
  function automatic int baseQ_to_decimal(string num, int Q);
    int decimal = 0;
    for (int i = 0; i < num.len(); i++) begin
      decimal = decimal * Q + char_to_val(num[i]);
    end
    return decimal;
  endfunction


  // Convert decimal to T base
  function automatic string decimal_to_baseT(int decimal, int T);
    string result = "";
    int remainder;
    byte ch;

    if (decimal == 0)
      return "0";

    while (decimal > 0) begin
      remainder = decimal % T;

      if (remainder < 10)
        ch = remainder + "0";
      else
        ch = remainder - 10 + "A";

      result = {ch, result}; // prepend
      decimal = decimal / T;
    end

    return result;
  endfunction


  initial begin
    string input_num = "A";   // Example
    int Q = 16;                   // From base 2
    int T = 8;                  // To base 16

    int decimal;
    string result;

    decimal = baseQ_to_decimal(input_num, Q);
    result  = decimal_to_baseT(decimal, T);

    $display("Input: %s (Base %0d)", input_num, Q);
    $display("Decimal: %0d", decimal);
    $display("Output: %s (Base %0d)", result, T);
  end

endmodule
