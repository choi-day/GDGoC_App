import 'package:flutter/material.dart';
import 'package:flutter_session10_gorouter/subView.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/details',
        name: 'details',
        builder: (context, state) => DetailsPage(
          extraData: state.extra as Map<String, dynamic>?,
        ),
      ),
      GoRoute(
        path: '/profile/:id',
        name: 'profile',
        builder: (context, state) => ProfilePage(
          userId: state.pathParameters['id']!,
          tab: state.uri.queryParameters['tab'],
        ),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
