import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final Function()? onSave;
  final TextEditingController controller;
  const DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[200],
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: "ADD",
                  onPressed: onSave,
                ),
                const SizedBox(width: 10),
                Button(
                  text: "CLOSE",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
