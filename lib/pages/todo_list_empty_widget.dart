import 'package:flutter/material.dart';

class TodoListEmptyWidget extends StatelessWidget {
  const TodoListEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sua lista tá vazia. Vá procurar algo para fazer!'),
    );
  }
}
