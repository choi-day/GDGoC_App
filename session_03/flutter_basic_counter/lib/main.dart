// import 'package:flutter/material.dart';
// import 'package:flutter_basic_counter/stateful_count.dart';
// import 'package:flutter_basic_counter/stateless_count.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: const StatefulWideget_ver(title: 'Stateful_widget'),

//       home: const StatelessWidget_ver(title: 'Stateless_widget'),
//     );
//   }
// }
// // // // // import 'package:flutter/material.dart';

// // // // // void main() => runApp(const ExpandedApp());

// // // // // class ExpandedApp extends StatelessWidget {
// // // // //   const ExpandedApp({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       home: Scaffold(
// // // // //         appBar: AppBar(
// // // // //           title: const Text('Expanded Column Sample'),
// // // // //         ),
// // // // //         body: const ExpandedExample(),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // class ExpandedExample extends StatelessWidget {
// // // // //   const ExpandedExample({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Center(
// // // // //       child: Column(
// // // // //         children: <Widget>[
// // // // //           Container(
// // // // //             color: Colors.blue,
// // // // //             height: 100,
// // // // //             width: 100,
// // // // //           ),
// // // // //           Expanded(
// // // // //             child: Container(
// // // // //               color: Colors.amber,
// // // // //               width: 100,
// // // // //             ),
// // // // //           ),
// // // // //           Container(
// // // // //             color: Colors.blue,
// // // // //             height: 100,
// // // // //             width: 100,
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';

// // // // void main() {
// // // //   runApp(const MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   const MyApp({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Flutter Demo',
// // // //       theme: ThemeData(
// // // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // // //         useMaterial3: true,
// // // //       ),
// // // //       home: const MyWidget(),
// // // //     );
// // // //   }
// // // // }

// // // // class MyWidget extends StatelessWidget {
// // // //   const MyWidget({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('제목'),
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Positioned(
// // // //             top: 20,
// // // //             left: 20,
// // // //             child: Container(
// // // //               color: Colors.red,
// // // //               width: 100,
// // // //               height: 100,
// // // //               padding: const EdgeInsets.all(8),
// // // //               margin: const EdgeInsets.all(8.0),
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             top: 50,
// // // //             left: 50,
// // // //             child: Container(
// // // //               color: Colors.green,
// // // //               width: 100,
// // // //               height: 100,
// // // //               padding: const EdgeInsets.all(8),
// // // //               margin: const EdgeInsets.all(8.0),
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             top: 80,
// // // //             left: 80,
// // // //             child: Container(
// // // //               color: Colors.blue,
// // // //               width: 100,
// // // //               height: 100,
// // // //               padding: const EdgeInsets.all(8),
// // // //               margin: const EdgeInsets.all(8.0),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //           appBar: AppBar(
// // //             title: const Text('Padding Examples'),
// // //           ),
// // //           body: Container(
// // //             color: Colors.red,
// // //             child: Padding(
// // //               padding:
// // //                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
// // //               child: Container(
// // //                 color: Colors.blue,
// // //                 width: 200,
// // //                 height: 100,
// // //                 child: const Center(
// // //                   child: Text('Example 1'),
// // //                 ),
// // //               ),
// // //             ),
// // //           )),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'Flutter AppBar Example',
// //       home: MyWidget(),
// //     );
// //   }
// // }

// // class MyWidget extends StatelessWidget {
// //   const MyWidget({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('My App'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.search),
// //             onPressed: () {
// //               // 검색 기능 구현
// //             },
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.settings),
// //             onPressed: () {
// //               // 설정 화면 열기
// //             },
// //           ),
// //         ],
// //         backgroundColor: Colors.blue,
// //         elevation: 4.0,
// //       ),
// //       body: const Center(
// //         child: Text('Welcome to my app!'),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Center Example',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Center Example'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
