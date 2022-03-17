import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/pages/cubit/todo_list_cubit.dart';

class TodoInputWidget extends StatefulWidget {
  final void Function(String) onSubmit;

  const TodoInputWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<TodoInputWidget> createState() => _TodoInputWidgetState();
}

class _TodoInputWidgetState extends State<TodoInputWidget> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoListCubit>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black12,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: inputController,
              decoration: const InputDecoration(
                hintText: 'Adicione uma tarefa',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              cubit.addTarefa(inputController.text);
              inputController.clear();
            },
          )
        ],
      ),
    );
  }
}
