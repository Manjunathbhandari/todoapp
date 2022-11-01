import 'package:flutter/material.dart';

import '../model/taskmodel.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem})
      : super(key: key);
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(children: [
          InkWell(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        content: const Text(
                            "Are You Sure You Want To Delete This Item ?",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            )),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, "Cancel"),
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 16),
                              )),
                          TextButton(
                              onPressed: () => {
                                    Navigator.of(context).pop(
                                      onDeleteItem(todo.id),
                                    )
                                  },
                              child: const Text("Yes",
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 16))),
                        ],
                      ));
            },
            onTap: () {
              onToDoChanged(todo);
            },
            child: Row(
              children: [
                Icon(
                    todo.isDone
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Colors.blue),
                const SizedBox(
                  width: 10,
                ),
                Text(todo.todoText!,
                    style: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontSize: 16,
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
