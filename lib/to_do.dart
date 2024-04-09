import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Medium;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: MyTodo.todos.isEmpty
          ? const Center(
              child: Text('Nothing to do'),
            )
          : ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return TodoItem(
                  todo: todo,
                  onChanged: (value) {
                    setState(() {
                      MyTodo.todos[index].completed = value;
                    });
                  },
                );
              },
            ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setBuilderState) => Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'What to do?'),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Select Priority'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<TodoPriority>(
                    value: TodoPriority.Low,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Low.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.Medium,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.Medium.name),
                  Radio<TodoPriority>(
                    value: TodoPriority.High,
                    groupValue: priority,
                    onChanged: (value) {
                      setBuilderState(() {
                        priority = value!;
                      });
                    },
                  ),
                  Text(TodoPriority.High.name),
                ],
              ),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, "Input can't be empty!");
      return;
    }
    final todo = MyTodo(
      id: DateTime.now().millisecondsSinceEpoch,
      name: _controller.text,
      priority: priority,
    );
    MyTodo.todos.add(todo);
    _controller.clear();
    setState(() {});
    Navigator.pop(context);
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Caution!'),
      content: Text(s),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("CLOSE"),
        ),
      ],
    ),
  );
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  const TodoItem({super.key, required this.todo, required this.onChanged})
      : super();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todo.name),
      subtitle: Text('Priority:${todo.priority.name}'),
      value: todo.completed,
      onChanged: (value) {
        onChanged(value!);
      },
    );
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}

// ignore: constant_identifier_names
enum TodoPriority { Low, Medium, High }
