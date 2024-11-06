import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FutureBuilder Example')),
        body: const Center(child: DataFetcher()),
      ),
    );
  }
}

class DataFetcher extends StatelessWidget {
  const DataFetcher({super.key});

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2)); // 2초 대기
    return 'Hello, FutureBuilder!'; // 결과 반환
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchData(), // 비동기 작업
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 비동기 작업이 진행 중일 때
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 비동기 작업에서 오류가 발생했을 때
          return Text('Error: ${snapshot.error}');
        } else {
          // 비동기 작업이 완료되었을 때
          return Text('Result: ${snapshot.data}');
        }
      },
    );
  }
}
