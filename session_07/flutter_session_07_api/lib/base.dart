import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 기본적으로 title만 받는 코드
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HTTP Example'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Data: ${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      // If the server returns an OK response, parse the JSON.
      final data = json.decode(response.body);
      return data['title']; // 예시로 제목을 반환
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
