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
  List<dynamic>? data;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var url = "http://jsonplaceholder.typicode.com/photos";
    var uri = Uri.parse(url);
    var res = await http.get(uri);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HTTP")),
        body: data != null
            ? ListView.builder(
                itemBuilder: (context, i) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Colors.amber,
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5.0),
                      ]),

                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(9.0),
                  // color: Colors.amber,
                  child: Text("${data?[i]["id"]}"),
                ),
                itemCount: data?.length,
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
