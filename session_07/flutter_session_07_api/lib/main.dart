import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// title과 body 데이터를 둘 다 받아 화면에 반환하는 코드
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
          child: FutureBuilder<Post>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // 데이터가 성공적으로 로드되면 제목과 본문을 카드 형태로 표시
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title: ${snapshot.data?.title}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Body:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            snapshot.data?.body ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Post> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      // 서버가 OK 응답을 반환하면 JSON을 파싱
      return Post.fromJson(json.decode(response.body));
    } else {
      // 서버가 200 OK 응답을 반환하지 않으면 예외를 발생
      throw Exception('Failed to load data');
    }
  }
}

// Post 클래스를 정의하여 title과 body를 포함
class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      body: json['body'],
    );
  }
}
