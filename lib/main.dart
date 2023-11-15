// ignore_for_file: dead_code

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var firstValue = TextEditingController();
  var secondValue = TextEditingController();
  var finalValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          color: Colors.amber.shade100,
          child: Column(children: [
            TextField(
              controller: firstValue,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: secondValue,
              keyboardType: TextInputType.number,
            ),
            TextField(controller: finalValue, enabled: false),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button(value1: firstValue, value2: secondValue, operator: "+"),
                button(value1: firstValue, value2: secondValue, operator: "-"),
                button(value1: firstValue, value2: secondValue, operator: "*"),
                button(value1: firstValue, value2: secondValue, operator: "/"),
              ],
            )
          ]),
        ),
      ),
    );
  }

  ElevatedButton button(
      {required dynamic value1,
      required dynamic value2,
      required String operator}) {
    return ElevatedButton(
        onPressed: () {
          switch (operator) {
            case "+":
              finalValue.text =
                  (int.parse(value1.text) + int.parse(value2.text)).toString();
              break;
            case "-":
              finalValue.text =
                  (int.parse(value1.text) - int.parse(value2.text)).toString();
              break;
            case "*":
              finalValue.text =
                  (int.parse(value1.text) * int.parse(value2.text)).toString();
              break;
            case "/":
              finalValue.text =
                  (int.parse(value1.text) / int.parse(value2.text)).toString();
              break;
          }
        },
        child: Text(operator));
  }
}
