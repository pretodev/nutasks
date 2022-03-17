import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/tarefa.dart';
import 'package:todolist/pages/cubit/todo_list_cubit.dart';

import 'todo_list_empty_widget.dart';

class TodoContentWidget extends StatelessWidget {
  const TodoContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListCubit, List<Tarefa>>(
      builder: (context, state) {
        final cubit = context.read<TodoListCubit>();
        return Visibility(
          visible: state.isNotEmpty,
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final tarefa = state[index];
              return Dismissible(
                key: Key(tarefa.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  cubit.removerTarefa(index);
                },
                child: ListTile(
                  leading: Checkbox(
                    value: tarefa.taCompleta,
                    onChanged: (checked) => {
                      cubit.alterarStatusTarefa(index, checked ?? false),
                    },
                  ),
                  title: Text(tarefa.descricao),
                  subtitle: Text('Criada em ${tarefa.criadoEm}'),
                ),
              );
            },
          ),
          replacement: const TodoListEmptyWidget(),
        );
      },
    );
  }
}
