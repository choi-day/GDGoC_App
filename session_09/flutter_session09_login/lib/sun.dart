import 'package:flutter/material.dart';

// 로그인이 된 것을 확인할 수 있도록 적는 스크린
class SubScreen extends StatelessWidget {
  const SubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sub Screen')),
      body: const Center(child: Text('Welcome to the Sub Screen!')),
    );
  }
}
