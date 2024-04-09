import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
    int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Counter App"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("You have pushed the button this many times:"),
          Text(
            '$count',
            style: const TextStyle(fontSize: 40),
          ),
        ]),
      ),
    );
  }
}
