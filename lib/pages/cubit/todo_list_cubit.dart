import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/tarefa.dart';

class TodoListCubit extends Cubit<List<Tarefa>> {
  TodoListCubit() : super([]);

  void addTarefa(String descricao) {
    emit([...state, Tarefa(descricao)]);
  }

  void alterarStatusTarefa(int posicao, bool taCompleta) {
    final tarefaCompletada = state[posicao].copiarCom(taCompleta: taCompleta);
    state[posicao] = tarefaCompletada;
    emit([...state]);
  }

  void removerTarefa(int posicao) {
    final currentState = [...state];
    currentState.removeAt(posicao);
    emit([...currentState]);
  }
}
