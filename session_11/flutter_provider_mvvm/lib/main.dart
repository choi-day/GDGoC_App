import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
class CounterModel {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
  }
}

// ViewModel
class CounterViewModel extends ChangeNotifier {
  final CounterModel _model;

  CounterViewModel(this._model);

  int get count => _model.count;

  void increment() {
    _model.increment();
    notifyListeners(); // 상태가 변경되었음을 알림
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(CounterModel()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM Example',
      home: CounterScreen(),
    );
  }
}

// View
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('MVVM Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment, // ViewModel의 increment 호출
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
