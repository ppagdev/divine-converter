I64 getInput() {
  return Str2I64(GetStr("Please enter a sacred binary number with up to 8 digits.\n"));
}

Bool isBinary(I64 num) {
  I64 numlength = 0;

  while (num != 0) {
    numlength++;
    I64 i = num % 10;
    if ((i != 0 && i != 1) || (numlength > 8)) {
      // is not binary OR is longer than 8 digits, return false
      return FALSE;
    }
    num /= 10;
  }
  return TRUE;
}

I64 bin2dec(I64 bin) {
  if (bin == 0) {
    return 0;
  }
  I64 numlength = 0;

  // store bin in separate variable
  I64 bincopy = bin;

  // get number of digits
  while (bincopy != 0) {
    numlength++;
    bincopy /= 10;
  };

  I64 dec = 0;
  I64 i;
  // convert to decimal
  for (i = 1; i <= numlength; i++) {
    // get next digit (right to left)
    I64 digit = bin % 10;

    dec += (digit*(2`(i-1)));
    bin /= 10;
  }
  return dec;
}

I64 bin;
I64 dec;

// get binary numer from user
do {
bin = getInput;
} while (!isBinary(bin));


// print binary number
Print("Holy Binary: %d \n", bin);

// get decimal equivalent of original number and print it
dec = bin2dec(bin);
Print("Holy Decimal: %d \n", dec);
