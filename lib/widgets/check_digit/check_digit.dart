bool checkDigit(String cntr) {
  bool check = false;
  int i = 0;
  int n = 0;
  int tong = 0;

  try {
    cntr.length == 11
        ? {
            for (i; i <= 9; i++)
              {
                if (i <= 3)
                  {
                    tong = tong + WordtoNum(cntr[i]) * Luythua(2, i),
                  }
                else
                  {
                    tong = tong + int.parse(cntr[i]) * Luythua(2, i),
                  }
              },
            n = tong % 11,
            if (n == 10) {n = 0},
            n == int.parse(cntr[10]) ? check = true : check = false,
          }
        : check = false;
  } on Exception catch (e) {
    throw Exception('Error: $e Check Digit');
  }
  return check;
}

int WordtoNum(String word) {
  int i = 0;
  try {
    switch (word.toUpperCase()) {
      case "A":
        i = 10;
        break;
      case "B":
        i = 12;
        break;
      case "C":
        i = 13;
        break;
      case "D":
        i = 14;
        break;
      case "E":
        i = 15;
        break;
      case "F":
        i = 16;
        break;
      case "G":
        i = 17;
        break;
      case "H":
        i = 18;
        break;
      case "I":
        i = 19;
        break;
      case "J":
        i = 20;
        break;
      case "K":
        i = 21;
        break;
      case "L":
        i = 23;
        break;
      case "M":
        i = 24;
        break;
      case "N":
        i = 25;
        break;
      case "O":
        i = 26;
        break;
      case "P":
        i = 27;
        break;
      case "Q":
        i = 28;
        break;
      case "R":
        i = 29;
        break;
      case "S":
        i = 30;
        break;
      case "T":
        i = 31;
        break;
      case "U":
        i = 32;
        break;
      case "V":
        i = 34;
        break;
      case "W":
        i = 35;
        break;
      case "X":
        i = 36;
        break;
      case "Y":
        i = 37;
        break;
      case "Z":
        i = 38;
        break;
    }
  } on Exception catch (e) {
    throw Exception('Error: $e Check Digit');
  }
  return i;
}

int Luythua(int a, int i) {
  int luythua = 1;
  if (i == 0) {
    luythua = 1;
  } else {
    for (int i1 = 1; i1 <= i; i1++) {
      luythua = luythua * a;
    }
  }
  return luythua;
}
