import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/counter/ui/counter_page.dart';
import 'package:flutter_riverpod_demo/demo/provider/ui/provider_page.dart';

import 'demo/state-provider/ui/state_provider_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 4, 49, 154)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Riverpod Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CounterPage()));
                },
                child: Text('Basic Counter with Riverpod')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProviderPage()));
                },
                child: Text('Provider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const StateProviderPage()));
                },
                child: Text('StateProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CounterPage()));
                },
                child: Text('FutureProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CounterPage()));
                },
                child: Text('StreamProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CounterPage()));
                },
                child: Text('NotifierProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CounterPage()));
                },
                child: Text('StateNotifierProvider')),
            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CounterPage()));
                },
                child: Text('ChangeNotifierProvider')),
          ]        ),
      ),
    );        
  }
}
