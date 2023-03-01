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

String unitReadBeforeComma(String? unit) {
  if (unit == "tr") {
    return "Lira";
  } else if (unit == "\$") {
    return "Dollars";
  } else if (unit == "€") {
    return "Euros";
  } else {
    return "Lira";
  }
}

String unitReadAfterComma(String? unit) {
  if (unit == "tr") {
    return "Kuruş";
  } else if (unit == "\$") {
    return "Cents";
  } else if (unit == "€") {
    return "Cents";
  } else {
    return "Kuruş";
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
