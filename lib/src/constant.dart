import 'package:money_to_text/src/money_unit.dart';

String hundredText(String? lang) {
  if (lang == "tr") {
    return "Yüz";
  } else if (lang == "en") {
    return "Hundred";
  } else {
    return "Yüz";
  }
}

List<String> basamakBirler(String? lang) {
  if (lang == "tr") {
    return [
      "",
      "Bir",
      "İki",
      "Üç",
      "Dört",
      "Beş",
      "Altı",
      "Yedi",
      "Sekiz",
      "Dokuz",
    ];
  } else if (lang == "en") {
    return [
      "",
      "One",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
    ];
  } else {
    return [
      "",
      "Bir",
      "İki",
      "Üç",
      "Dört",
      "Beş",
      "Altı",
      "Yedi",
      "Sekiz",
      "Dokuz",
    ];
  }
}

List<String> basamakOnlar(String? lang) {
  if (lang == "tr") {
    return [
      "",
      "On",
      "Yirmi",
      "Otuz",
      "Kırk",
      "Elli",
      "Altmış",
      "Yetmiş",
      "Seksen",
      "Doksan",
    ];
  } else if (lang == "en") {
    return [
      "",
      "Ten",
      "Twenty",
      "Thirty",
      "Forty",
      "Fifty",
      "Sixty",
      "Seventy",
      "Eighty",
      "Ninety",
    ];
  } else {
    return [
      "",
      "On",
      "Yirmi",
      "Otuz",
      "Kırk",
      "Elli",
      "Altmış",
      "Yetmiş",
      "Seksen",
      "Doksan",
    ];
  }
}

List<String> basamakBinler(String? lang) {
  if (lang == "tr") {
    return [
      "",
      "Bin",
      "Milyon",
      "Milyar",
      "Trilyon",
      "Katrilyon",
    ];
  } else if (lang == "en") {
    return [
      "",
      "Thousand",
      "Million",
      "Billion",
      "Trillion",
      "Quadrillion",
    ];
  } else {
    return [
      "",
      "Bin",
      "Milyon",
      "Milyar",
      "Trilyon",
      "Katrilyon",
    ];
  }
}

String unitReadBeforeComma(MoneyUnit? unit, int money, String? lang) {
  switch (unit) {
    case MoneyUnit.turkishLira:
      if (money > 1) {
        if (lang == "tr") {
          return "Lira";
        } else if (money == 0) {
          return "";
        } else {
          return "Liras";
        }
      } else {
        if (money == 0) {
          return "";
        }
        return "Lira";
      }

    case MoneyUnit.dollar:
      if (money > 1) {
        if (lang == "tr") {
          return "Dolar";
        } else if (money == 0) {
          return "";
        } else {
          return "Dollars";
        }
      } else {
        if (money == 0) {
          return "";
        }
        return "Dolar";
      }
    case MoneyUnit.euro:
      if (money > 1) {
        if (lang == "tr") {
          return "Euro";
        } else if (money == 0) {
          return "";
        } else {
          return "Euros";
        }
      } else {
        if (money == 0) {
          return "";
        }
        return "Euro";
      }
    default:
      if (money > 1) {
        if (lang == "tr") {
          return "Lira";
        } else if (money == 0) {
          return "";
        } else {
          return "Liras";
        }
      } else {
        if (money == 0) {
          return "";
        }
        return "Lira";
      }
  }
}

String unitReadAfterComma(MoneyUnit? unit, int money, String? lang) {
  switch (unit) {
    case MoneyUnit.turkishLira:
      if (money > 1) {
        if (lang == "tr") {
          return "Kuruş";
        } else {
          return "Kurus";
        }
      } else {
        return "Kuruş";
      }
    case MoneyUnit.dollar:
      if (money > 1) {
        if (lang == "tr") {
          return "Cent";
        } else {
          return "Cents";
        }
      } else {
        return "Cent";
      }
    case MoneyUnit.euro:
      if (money > 1) {
        if (lang == "tr") {
          return "Cent";
        } else {
          return "Cents";
        }
      } else {
        return "Cent";
      }

    default:
      if (money > 1) {
        if (lang == "tr") {
          return "Kuruş";
        } else {
          return "Kurus";
        }
      } else {
        return "Kuruş";
      }
  }
}

String zeroText(String? lang) {
  if (lang == "tr") {
    return "Sıfır";
  } else if (lang == "en") {
    return "Zero";
  } else {
    return "Sıfır";
  }
}

String supportedLanguageCode(String? lang) {
  if (lang == "tr") {
    return "tr";
  } else if (lang == "en") {
    return "en";
  } else {
    return "tr";
  }
}
