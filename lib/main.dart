// ignore_for_file: dead_code

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  dynamic calculation(
      {required dynamic value1,
      required dynamic value2,
      required String operator}) {
    switch (operator) {
      case "+":
        return (int.parse(value1.text) + int.parse(value2.text)).toString();
        break;
      case "-":
        return (int.parse(value1.text) - int.parse(value2.text)).toString();
        break;
      case "*":
        return (int.parse(value1.text) * int.parse(value2.text)).toString();
        break;
      case "/":
        return (int.parse(value1.text) / int.parse(value2.text)).toString();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          color: Colors.blue.shade100,
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
                ElevatedButton(
                    onPressed: () {
                      finalValue.text = calculation(
                          value1: firstValue,
                          value2: secondValue,
                          operator: "+");
                      setState(() {});
                    },
                    child: const Text("ADD")),
                ElevatedButton(
                    onPressed: () {
                      finalValue.text = calculation(
                          value1: firstValue,
                          value2: secondValue,
                          operator: "-");
                      setState(() {});
                    },
                    child: const Text("SUB")),
                ElevatedButton(
                    onPressed: () {
                      finalValue.text = calculation(
                          value1: firstValue,
                          value2: secondValue,
                          operator: "/");
                      setState(() {});
                    },
                    child: const Text("DIV")),
                ElevatedButton(
                    onPressed: () {
                      finalValue.text = calculation(
                          value1: firstValue,
                          value2: secondValue,
                          operator: "*");
                      setState(() {});
                    },
                    child: const Text("MUL")),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
