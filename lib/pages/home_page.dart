import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/todo_tile.dart';

import '../utilities/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List listTile = [];
  saveToList() {
    setState(() {
      listTile.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.yellow[100]),
        child: ListView.builder(
            itemBuilder: (context, i) => ToDoTile(
                  checkBox: listTile[i][1],
                  onChanged: (value) {
                    setState(() {
                      listTile[i][1] = value;
                    });
                  },
                  taskName: listTile[i][0],
                  onDelete: (context) {
                    // Navigator.of(context).pop();
                    setState(() {
                      listTile.removeAt(i);
                    });
                  },
                ),
            itemCount: listTile.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: _controller,
                onSave: () => saveToList(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
