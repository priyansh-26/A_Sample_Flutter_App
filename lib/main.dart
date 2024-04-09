import 'package:flutter/material.dart';
import 'package:sample_app/menu_page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
    home: MenuPage(),);
  }
}

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Example'),
        ),
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              tileColor: index.isEven ? Colors.grey : Colors.grey[300],
              title: Text('Item ${index + 1}'),
              subtitle: Text('This is a subtitle ${index + 1}'),
            ),
          ),
        ),
    );
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> item = List.generate(100, (index) => 'Item ${index + 1}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid View Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1,
          ),
          itemCount: item.length,
          itemBuilder: (context, index) => Card(
            child: Center(
              child: Text(item[index]),
            ),
          ),
        ),
      ),
    );
  }
}
