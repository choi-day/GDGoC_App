import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todos = [];

  void _addTodo() {
    String title = "";
    String description = "";
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('나의 할일'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(hintText: "글 제목"),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(hintText: "글 내용"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  setState(() {
                    todos.add(Todo(
                      title: title,
                      description: description,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("추가하기"),
            ),
          ],
        );
      },
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" To do List "),
        actions: [
          IconButton(
            onPressed: _addTodo,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodo(index),
            ),
          );
        },
      ),
    );
  }
}
