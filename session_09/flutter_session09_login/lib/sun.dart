import 'package:flutter/material.dart';

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
