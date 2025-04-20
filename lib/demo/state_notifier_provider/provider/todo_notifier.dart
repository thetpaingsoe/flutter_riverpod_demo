import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  String title;
  bool isCompleted;
  Todo({required this.title, this.isCompleted = false});
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    state = [ ...state, Todo(title: title)];
  }

  void completeTodo(int index) {
    if(index < state.length) {
      final todo = state[index];
      state = [
        ...state.sublist(0, index),
        Todo(title: todo.title, isCompleted: !todo.isCompleted),
        ...state.sublist(index + 1),
      ];
    }
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});