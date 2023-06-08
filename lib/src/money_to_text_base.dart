import 'package:money_to_text/src/constant.dart';
import 'package:money_to_text/src/money_unit.dart';
import 'package:money_to_text/src/turkish.dart';

/// Unit supported $, €, ₺
///
/// Money Import value: 2136.3 or 2136,30
///
/// Supported Language Turkish, English
///
/// Default unit ₺ and Default Language Turkish
///
/// alwaysShowAfterComma=true, it returns zero cents if the value after the decimal point is 0 cents.
///
/// alwaysShowAfterComma=false, it will not return it if the value after the decimal point is 0 cents.

String moneyToText(String money, {MoneyUnit? unit, String? lang, bool alwaysShowAfterComma = true}) {
  if (money.isNotEmpty) {
    double? comeMoney = double.tryParse(money.replaceAll(",", "."));
    if (comeMoney == null) {
      return unSupportedText("type");
    } else {
      return _convertTheMoney(comeMoney, lang, unit, alwaysShowAfterComma);
    }
  } else {
    return "";
  }
}

String _convertTheMoney(double money, String? lang, MoneyUnit? unit, bool alwaysShowAfterComma) {
  String beforeCommaText = "";
  String afterCommaText = "";
  List<String> moneyList = money.toString().split(".");
  String beforeComma = moneyList.first;
  String afterComma = moneyList.last;
  if (afterComma.length == 1) {
    afterComma = afterComma.padRight(2, "0");
  }
  if (afterComma.length > 2 || beforeComma.length > 18) {
    return unSupportedText("type");
  } else {
    //* BeforeComma Read
    int groupLength = basamakBinler(lang).length;
    beforeComma = beforeComma.padLeft((groupLength * 3), "0");

    for (var i = 0; i < groupLength; i++) {
      String activeNumber = beforeComma.toString().substring(beforeComma.length - (3 * i) - 3, beforeComma.length - (3 * i));
      String tempGroupValue = readHundred(activeNumber, lang, i);
      beforeCommaText = tempGroupValue + beforeCommaText;
    }

    // After Comma Read

    if (afterComma[0] != "0") {
      afterCommaText += basamakOnlar(lang)[int.parse(afterComma[0])];
    }

    //* Birler Okuması

    if (afterComma == "00" && alwaysShowAfterComma == false) {
      afterCommaText = "";
    } else {
      afterCommaText += (basamakBirler(lang)[int.tryParse(afterComma[1]) ?? 0]);

      if (afterCommaText.trim().isEmpty) {
        afterCommaText = zeroText(lang);
      }
    }

    if (afterCommaText.isEmpty && alwaysShowAfterComma == false) {
      if (supportedLanguageCode(lang) == "tr") {
        return "${beforeCommaText.toLowerCaseTR()}${unitReadBeforeComma(unit, int.tryParse(beforeComma) ?? 0, lang)}".trim().replaceAll("  ", " ");
      } else {
        return "${beforeCommaText.toLowerCase()}${unitReadBeforeComma(unit, int.tryParse(beforeComma) ?? 0, lang)}".trim().replaceAll("  ", " ");
      }
    } else {
      if (supportedLanguageCode(lang) == "tr") {
        return "${beforeCommaText.toLowerCaseTR()}${unitReadBeforeComma(unit, int.tryParse(beforeComma) ?? 0, lang)}${getMiddleOperation(beforeComma)}${"${afterCommaText.toLowerCaseTR()}${unitReadAfterComma(
          unit,
          int.tryParse(beforeComma) ?? 0,
          lang,
        )}".trim().replaceAll("  ", " ")}";
      } else {
        return "${beforeCommaText.toLowerCase()}${unitReadBeforeComma(unit, int.tryParse(beforeComma) ?? 0, lang)}${getMiddleOperation(beforeComma)}${afterCommaText.toLowerCaseTR()}${unitReadAfterComma(unit, int.tryParse(afterComma) ?? 0, lang)}".trim().replaceAll("  ", " ");
      }
    }
  }
}

String getMiddleOperation(String beforeComma) {
  int va = int.tryParse(beforeComma.trim()) ?? 0;
  if (va == 0) {
    return "";
  }
  return ", ";
}

String readHundred(String activeNumber, String? lang, int i) {
  if (activeNumber.length == 3) {
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
        tempGroupValue += (hundredText(lang));
      } else {
        tempGroupValue += "${basamakBirler(lang)[int.parse(activeNumber[0])]}${hundredText(lang)}";
      }

      ///Onlar Okuması

      if (onlar != "0") {
        tempGroupValue += (basamakOnlar(lang)[int.parse(activeNumber[1])]);
      }

      ///Birler Okuması

      tempGroupValue += (basamakBirler(lang)[int.parse(birler)]).trim();

      /// Binlik Basamak Değer

      tempGroupValue += (basamakBinler(lang)[(i).round()]);
    }

    return tempGroupValue;
  } else {
    return "null";
  }
}

String unSupportedText(String type) {
  return "unSupported Money";
}
