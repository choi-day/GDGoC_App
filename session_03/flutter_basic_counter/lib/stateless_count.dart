import 'package:flutter/material.dart';

class StatelessWidget_ver extends StatelessWidget {
  const StatelessWidget_ver({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const int counter = 0; // 상태가 없는 고정된 값

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null, // StatelessWidget에서는 상태를 변경할 수 없음
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
