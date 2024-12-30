import 'package:flutter/material.dart';

// Model
class CounterModel {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }
}

// Controller
class CounterController {
  final CounterModel _model;

  CounterController(this._model);

  int get count => _model.count;

  void increment() {
    _model.increment();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC Example',
      home: CounterScreen(),
    );
  }
}

// View
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterModel _model = CounterModel();
  late CounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CounterController(_model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVC Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_controller.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.increment();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
