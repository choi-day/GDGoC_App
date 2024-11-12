import 'package:flutter/material.dart';
import 'package:flutter_sql_todolist/todo_app.dart';
import 'todo.dart';
import 'todo_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoApp(),
    );
  }
}
