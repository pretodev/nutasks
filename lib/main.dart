import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/tarefa.dart';
import 'package:todolist/pages/cubit/todo_list_cubit.dart';
import 'package:todolist/pages/todo_list_page.dart';

void main() {
  // adicao de tarefas
  List<Tarefa> minhasTarefas = [];
  minhasTarefas.add(Tarefa('Fazer compras'));
  minhasTarefas.add(Tarefa('Limpar o fogão'));
  minhasTarefas.add(Tarefa('Ir na monitoria'));

  print(minhasTarefas);

  // remover
  minhasTarefas.removeAt(1);

  print(minhasTarefas);

  // edicao
  final tarefaEditada = minhasTarefas[0].copiarCom(taCompleta: true);
  minhasTarefas[0] = tarefaEditada;
  print(minhasTarefas);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoListCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const TodoListPage(),
      ),
    );
  }
}
