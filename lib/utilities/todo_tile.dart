import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool checkBox;
  final Function(BuildContext)? onDelete;
  final String taskName;
  final Function(bool?)? onChanged;
  const ToDoTile({
    super.key,
    required this.onDelete,
    required this.checkBox,
    required this.onChanged,
    required this.taskName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(8.0),
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(8.0)),
          child: Row(children: [
            Checkbox(
              value: checkBox,
              onChanged: onChanged,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: checkBox
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          ]),
        ),
      ),
    );
  }
}
