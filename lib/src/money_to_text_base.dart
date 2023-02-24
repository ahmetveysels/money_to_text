import 'package:money_to_text/src/constant.dart';

/// Unit supported $, €, ₺
///
/// Money Import value: 2136.3 or 2136,30
///
/// Supported Language Turkish, English
///
/// Default unit ₺ and Default Language Turkish
///

String moneyToText(String money, {String? unit, String? lang}) {
  if (money.isNotEmpty) {
    double? comeMoney = double.tryParse(money.replaceAll(",", "."));
    if (comeMoney == null) {
      return unSupportedText("type");
    } else {
      return _convertTheMoney(comeMoney, lang, unit);
    }
  } else {
    return "";
  }
}

String _convertTheMoney(double money, String? lang, String? unit) {
  String beforeCommaText = "";
  String afterCommaText = "";
  List<String> moneyList = money.toString().split(".");
  String beforeComma = moneyList.first;
  String afterComma = moneyList.last;
  if (afterComma.length == 1) {
    afterComma = afterComma.padRight(2, "0");
  }
  if (afterComma.length > 2 || afterComma.length > 19) {
    return unSupportedText("type");
  } else {
    //* BeforeComma Read
    int groupLength = basamakBinler(lang).length;
    beforeComma = beforeComma.padLeft((groupLength * 3), "0");

    for (var i = 0; i < groupLength; i++) {
      String activeNumber = beforeComma.toString().substring(
          beforeComma.length - (3 * i) - 3, beforeComma.length - (3 * i));

      String birler = activeNumber[2];
      String onlar = activeNumber[1];
      String yuzler = activeNumber[0];

      String tempGroupValue = "";

      if (activeNumber == "000") {
        //
      } else if (i == 1 && activeNumber == "001") {
        tempGroupValue += (basamakBinler(lang)[(i).round()]);
      } else {
        // Yüzler Okuması
        if (yuzler == "0") {
        } else if (yuzler == "1") {
          tempGroupValue += (" ${hundredText(lang)}");
        } else {
          tempGroupValue +=
              " ${basamakBirler(lang)[int.parse(activeNumber[0])]}${hundredText(lang)}";
        }

        ///Onlar Okuması

        if (onlar != "0") {
          tempGroupValue += (basamakOnlar(lang)[int.parse(activeNumber[1])]);
        }

        ///Birler Okuması

        tempGroupValue += (basamakBirler(lang)[int.parse(birler)]);

        /// Binlik Basamak Değer

        tempGroupValue += (basamakBinler(lang)[(i).round()]);
      }
      beforeCommaText = tempGroupValue + beforeCommaText;
    }

    // After Comma Read

    if (afterComma[0] != "0") {
      afterCommaText += basamakOnlar(lang)[int.parse(afterComma[0])];
    }

    //* Birler Okuması

    afterCommaText +=
        (" ${basamakBirler(lang)[int.tryParse(afterComma[1]) ?? 0]}");

    if (afterCommaText.trim().isEmpty) {
      afterCommaText = zeroText(lang);
    }

    return "$beforeCommaText ${unitReadBeforeComma(unit)} $afterCommaText ${unitReadAfterComma(unit)}"
        .trim()
        .replaceAll("  ", " ");
  }
}

String unSupportedText(String type) {
  return "unSupported Money";
}
