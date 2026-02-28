//BCD to Gray
// g3 = b3
assign g[3] = b[3];          // MSB same as input MSB
// g2 = b3 XOR b2
assign g[2] = b[3] ^ b[2];   // XOR for next bit
// g1 = b2 XOR b1
assign g[1] = b[2] ^ b[1];   // XOR logic
// g0 = b1 XOR b0
assign g[0] = b[1] ^ b[0];   // LSB conversion
*******************************************************
//Gray to BCD
assign b[3] = g[3];                 // MSB same
assign b[2] = b[3] ^ g[2];          // cumulative XOR
assign b[1] = b[2] ^ g[1];          // propagate XOR
assign b[0] = b[1] ^ g[0];          // final bit
*******************************************************
//Binary to gray
assign g[3] = b[3];          // MSB unchanged
assign g[2] = b[3] ^ b[2];   // XOR adjacent bits
assign g[1] = b[2] ^ b[1];   // XOR next pair
assign g[0] = b[1] ^ b[0];   // final XOR
**********************************************************
//gray to binary
assign b[3] = g[3];               // MSB same
assign b[2] = b[3] ^ g[2];        // propagate XOR
assign b[1] = b[2] ^ g[1];        // cumulative XOR
assign b[0] = b[1] ^ g[0];        // final bit
**********************************************************
//8421 to 2421
assign y[3] = x[3] | (x[2] & x[1]);     // MSB equation
assign y[2] = x[2] ^ x[1];              // XOR logic
assign y[1] = x[1];                     // middle bit same
assign y[0] = x[0];                     // LSB same
*********************************************************


//Binary to excess3
assign e = b + 4'd3;      // add constant 3
--------------------------------------------
assign e[0] = ~b[0];                          // LSB logic
assign e[1] = b[1] ^ b[0];                    // XOR for 2nd bit
assign e[2] = b[2] ^ (b[1] | b[0]);           // derived logic
assign e[3] = b[3] | (b[2] & b[1]);           // MSB equation
********************************************
//Excess 3 to Binary
assign b = e - 4'd3;      // subtract constant 3
**************************************************

