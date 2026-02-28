module signed_base_converter;

  function automatic int char_to_val(byte ch);
    if (ch >= "0" && ch <= "9")
      return ch - "0";
    else if (ch >= "A" && ch <= "F")
      return ch - "A" + 10;
    else
      return -1;
  endfunction


  function automatic int baseQ_to_decimal(string num, int Q);
    int decimal = 0;
    int start = 0;
    bit negative = 0;

    if (num[0] == "-") begin
      negative = 1;
      start = 1;
    end

    for (int i = start; i < num.len(); i++)
      decimal = decimal * Q + char_to_val(num[i]);

    if (negative)
      decimal = -decimal;

    return decimal;
  endfunction


  function automatic string decimal_to_baseT(int decimal, int T);
    string result = "";
    int remainder;
    bit negative = 0;

    if (decimal < 0) begin
      negative = 1;
      decimal = -decimal;
    end

    if (decimal == 0)
      return "0";

    while (decimal > 0) begin
      remainder = decimal % T;

      if (remainder < 10)
        result = {byte'(remainder + "0"), result};
      else
        result = {byte'(remainder - 10 + "A"), result};

      decimal = decimal / T;
    end

    if (negative)
      result = {"-", result};

    return result;
  endfunction


  initial begin
    string input_num = "-1011";  // -11 in base 2
    int Q = 2;
    int T = 16;

    int decimal;
    string result;

    decimal = baseQ_to_decimal(input_num, Q);
    result  = decimal_to_baseT(decimal, T);

    $display("Decimal = %0d", decimal);
    $display("Output  = %s (Base %0d)", result, T);
  end

endmodule
