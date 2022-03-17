import 'package:flutter/material.dart';
import 'package:todolist/pages/todo_content_widget.dart';
import 'package:todolist/pages/todo_input_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NuTasks'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(
            child: TodoContentWidget(),
          ),
          TodoInputWidget(
            onSubmit: (description) {
              print(description);
            },
          ),
        ],
      ),
    );
  }
}
