import 'package:flutter/material.dart';
import 'package:sample_app/counter.dart';
import 'package:sample_app/input_widget.dart';
import 'package:sample_app/main.dart';
import 'package:sample_app/scroll.dart';
import 'package:sample_app/to_do.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Home Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListViewExample()),
                );
              },
              child: const Text('Go to List View'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GridViewExample()),
                );
              },
              child: const Text('Go to Grid View'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterApp()),
                );
              },
              child: const Text('Go to Counter App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputWidgetExample()),
                );
              },
              child: const Text('Input Widgets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoList()),
                );
              },
              child: const Text('To Do List'),
            ),
          ],
        ),
      ),
    );
  }
}
