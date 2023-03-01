import 'package:flutter/material.dart';
import 'package:money_to_text/money_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Text Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String moneyText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Money to Text")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                Future.microtask(() {
                  setState(() {
                    moneyText = moneyToText(value,
                        unit: "₺", lang: "tr", alwaysShowAfterComma: false);
                    debugPrint(moneyText);
                  });
                });
              },
            ),
            const SizedBox(height: 20),
            Text(moneyText),
          ],
        ),
      ),
    );
  }
}
