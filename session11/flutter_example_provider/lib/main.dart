import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 모델 클래스 (ChangeNotifier를 확장하여 상태 관리 가능)
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
// 카운터 증가 함수
  void increment() {
    _count++;
    notifyListeners(); // 상태가 변경되었음을 알림
  }
}

void main() {
  runApp(
    // provider들을 선언
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
      ],
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
      title: 'Provider Example',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            // CoutnterModel의 상태를 알림받기 위한 위젯 Consumer
            Consumer<CounterModel>(
              builder: (context, counterModel, child) {
                return Text(
                  '${counterModel.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterModel>().increment(); // 상태 업데이트
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
