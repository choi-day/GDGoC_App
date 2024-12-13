import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/details', extra: {'message': 'From Home'});
              },
              child: const Text('Go to Details (go)'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  'profile',
                  pathParameters: {'id': '123'},
                  queryParameters: {'tab': 'info'},
                );
              },
              child: const Text('Go to Profile (goNamed)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Using push
                context
                    .push('/details', extra: {'message': 'From Home (push)'});
              },
              child: const Text('Push to Details'),
            ),
            ElevatedButton(
              onPressed: () {
                // Using pushNamed
                context.pushNamed('profile',
                    pathParameters: {'id': '456'},
                    queryParameters: {'tab': 'settings'});
              },
              child: const Text('Push to Profile (pushNamed)'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic>? extraData;

  const DetailsPage({super.key, this.extraData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Extra Data: ${extraData?['message'] ?? 'None'}'),
            ElevatedButton(
              onPressed: () {
                // Using pop
                context.pop('Goodbye from Details');
              },
              child: const Text('Pop to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userId;
  final String? tab;

  const ProfilePage({super.key, required this.userId, this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID: $userId'),
            Text('Tab: ${tab ?? 'None'}'),
            ElevatedButton(
              onPressed: () {
                // Using pushReplacement
                context.pushReplacement('/details',
                    extra: {'message': 'Replaced with Profile'});
              },
              child: const Text('Push Replacement to Details'),
            ),
            ElevatedButton(
              onPressed: () {
                // Using replace
                context.replace('/details',
                    extra: {'message': 'Replaced without animation'});
              },
              child: const Text('Replace with Details'),
            ),
          ],
        ),
      ),
    );
  }
}
