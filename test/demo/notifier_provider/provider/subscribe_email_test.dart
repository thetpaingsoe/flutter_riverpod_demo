
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/notifier_provider/provider/subscribe_email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  group("Notifier Provider Test", () {

    late ProviderContainer providerContainer;

    setUp((){
      providerContainer = ProviderContainer();
    });

    test("Testing subscribe email with blank email", () async {
      final provider = providerContainer.read(subscribeEmailProvider.notifier);
      await provider.subscribe('');
      
      expect(
        provider.state.error,
        isA<Exception>().having( 
          (e) => e.toString()
        ,
        "message",
        contains("Email cannot be empty"))
      );

    });

    test("Testing subscribe email with wrong format. it should return error", () async{
      final provider = providerContainer.read(subscribeEmailProvider.notifier);
      await provider.subscribe('abc');

      expect(
        provider.state.error,
        isA<Exception>().having(
          (e) => e.toString(), 
          "message", 
          contains('Invalid email format'))
      );
    });

    test("Testing subscribe email with success status. Data need to return true", () async {
      final provider = providerContainer.read(subscribeEmailProvider.notifier);

      await provider.subscribe("abc@gmail.com");
      
      expect(
        provider.state, 
        isA<AsyncData>().having(
          (val) => val.value, 
          "result", 
          true)
      );
    });

  });
  
}