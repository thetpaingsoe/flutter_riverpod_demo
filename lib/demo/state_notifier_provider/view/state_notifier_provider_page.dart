import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/state_notifier_provider/provider/todo_notifier.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  StateNotifierProviderPage({super.key});

  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todoList = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('State Notifier Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Text('State Notifier Provider Example'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 16, right:16),
              child: TextField(
                key: const Key('todo-text-field'),
                controller: _todoController,
                decoration: const InputDecoration(
                  labelText: 'Todo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('add-todo-button'),
              onPressed: () {
                ref.read(todoProvider.notifier).addTodo(_todoController.text);
                _todoController.clear();
              },
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      todoList[index].title,
                      style: TextStyle(
                        decoration: todoList[index].isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: Checkbox(
                      key: Key('todo-checkbox-${todoList[index].title}'),
                      value: todoList[index].isCompleted, 
                      onChanged: (value) {
                        ref.read(todoProvider.notifier).completeTodo(index);
                      },
                    ),                    
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}