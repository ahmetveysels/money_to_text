# Money To Text

With this flutter package, you can convert your money to text


## Features

![Money To Text Screenshot](https://avseng.net/flutterpackages/money_to_text/screenshot.png)

## Getting started

No permission is needed.

## Usage 

Please review the example folder

Supported Unit: $, €, ₺

Supported Language Turkish, English

Import Money Value: 2136.3 or 2136,30

Default Unit: ₺

Default Language: Turkish

Test with function
#
Example Function 1:

```dart
    
    String moneyText = moneyToText(3456,50);

    // Output: ÜçBin DörtYüzElliAltı Lira Elli Kuruş
    
```
 
Example Function 2:

```dart
    
    String moneyText = moneyToText(3456,50, unit: "₺", lang: "tr");

    // Output: ÜçBin DörtYüzElliAltı Lira Elli Kuruş
    
```
 
Example Function 3:

```dart
    
    String moneyText = moneyToText(3456,50, unit: "\$", lang: "en");

    // Output: ThreeThousand FourHundredFiftySix Dollars Fifty Cents

```

Example Function 4:

```dart
    
    String moneyText = moneyToText(3456,50, unit: "€", lang: "en");

    // Output: ThreeThousand FourHundredFiftySix Euros Fifty Cents

```


#
## Additional information

[avseng.net](https://avseng.net)
