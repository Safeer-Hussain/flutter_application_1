import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<List> fetchData() async {
    var url = "https://mocki.io/v1/79c4fbfe-5de6-4628-8b88-a585f5608c59";
    var uri = Uri.parse(url);
    var res = await http.get(uri);
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HTTP")),
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            return snapshot.hasData
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
                      child: Text("${snapshot.data?[i]["id"]}"),
                    ),
                    itemCount: snapshot.data?.length,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

/*
data != null
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
*/