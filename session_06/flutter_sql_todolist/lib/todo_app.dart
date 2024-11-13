import 'package:flutter/material.dart';
import 'package:flutter_sql_todolist/todo.dart';
import 'package:flutter_sql_todolist/todo_database.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  late TodoDatabase database;
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    database = TodoDatabase.instance;
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    todos = await database.getTodos();
    setState(() {});
  }

  Future<void> _addTodo() async {
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
              onPressed: () async {
                if (title.isNotEmpty && description.isNotEmpty) {
                  final todo = Todo(
                    title: title,
                    description: description,
                  );
                  await database.addTodo(todo);
                  await _loadTodos();
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

  Future<void> _deleteTodo(int id) async {
    await database.deleteTodo(id);
    await _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do List"),
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
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodo(todo.id!),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_sql_todolist/todo.dart';
// import 'package:flutter_sql_todolist/todo_database.dart';

// class TodoApp extends StatefulWidget {
//   const TodoApp({super.key});

//   @override
//   State<TodoApp> createState() => _TodoAppState();
// }

// class _TodoAppState extends State<TodoApp> {
//   late TodoDatabase database;
//   List<Todo> todos = [];

//   @override
//   void initState() {
//     super.initState();
//     database = TodoDatabase.instance;
//     _loadTodos();
//   }

//   Future<void> _loadTodos() async {
//     todos = await database.getTodos();
//     setState(() {});
//   }

//   Future<void> _addTodo() async {
//     String title = "";
//     String description = "";
//     final formKey = GlobalKey<FormState>();

//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: const Text('나의 할일'),
//           content: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   onChanged: (value) {
//                     title = value;
//                   },
//                   decoration: const InputDecoration(hintText: "글 제목"),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '제목을 입력하세요';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   onChanged: (value) {
//                     description = value;
//                   },
//                   decoration: const InputDecoration(hintText: "글 내용"),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '내용을 입력하세요';
//                     }
//                     return null;
//                   },
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () async {
//                 if (formKey.currentState!.validate()) {
//                   // 유효성 검사를 통과하면 할 일 추가
//                   final todo = Todo(
//                     title: title,
//                     description: description,
//                   );
//                   await database.addTodo(todo);
//                   await _loadTodos();
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: const Text("추가하기"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _deleteTodo(int id) async {
//     await database.deleteTodo(id);
//     await _loadTodos();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("To do List"),
//         actions: [
//           IconButton(
//             onPressed: _addTodo,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (_, index) {
//           final todo = todos[index];
//           return ListTile(
//             title: Text(todo.title),
//             subtitle: Text(todo.description),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () => _deleteTodo(todo.id!),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     database.close();
//     super.dispose();
//   }
// }
