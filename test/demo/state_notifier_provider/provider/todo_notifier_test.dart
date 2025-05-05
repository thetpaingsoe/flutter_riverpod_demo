
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/state_notifier_provider/provider/todo_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  late ProviderContainer providerContainer;

  setUp((){
    providerContainer = ProviderContainer();
  });

  group('Todo Notifier Test', () {
    
    test('Testing Add Todo', () {
      final provider = providerContainer.read(todoProvider.notifier);
      provider.addTodo("Todo 1");
      provider.addTodo("Todo 2");

      expect(provider.state, isA<List<Todo>>().having(
        (val) => val.length,
        "length",
        2
      ));

      expect(provider.state[0].title, "Todo 1");
      expect(provider.state[0].isCompleted, false);
      
    });

    test('Testing Complete Todo', () {
      final provider = providerContainer.read(todoProvider.notifier);
      provider.addTodo("Todo 1");

      expect(provider.state[0].isCompleted, false);

      provider.completeTodo(0);

      expect(provider.state[0].isCompleted, true);

    });

  });
}