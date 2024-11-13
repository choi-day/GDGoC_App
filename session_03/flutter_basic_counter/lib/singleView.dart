// import 'package:flutter/material.dart';

// /// Flutter code sample for [SingleChildScrollView].

// void main() => runApp(const SingleChildScrollViewExampleApp());

// class SingleChildScrollViewExampleApp extends StatelessWidget {
//   const SingleChildScrollViewExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: SingleChildScrollViewExample(),
//     );
//   }
// }

// class SingleChildScrollViewExample extends StatelessWidget {
//   const SingleChildScrollViewExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.bodyMedium!,
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints viewportConstraints) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical, // 세로 스크롤
//             child: Column(
//               children: List.generate(
//                 20,
//                 (index) => Container(
//                   height: 100,
//                   color: index % 2 == 0 ? Colors.blue : Colors.green,
//                   child: Center(
//                     child: Text('Item $index'),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
