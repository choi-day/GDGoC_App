// import 'package:flutter/material.dart';
// import 'auth_service.dart';

// class AuthViewModel with ChangeNotifier {
//   final AuthService _authService = AuthService();

//   bool _isLoading = false;
//   String? _errorMessage;

//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   Future<void> login(String email, String password) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       final result = await _authService.login(email, password);
//       // Handle success (e.g., store token or navigate to the next screen)
//       print('Login successful: ${result['token']}');
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> signup(String email, String password) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       final result = await _authService.signup(email, password);
//       // Handle success (e.g., show a success message)
//       print('Signup successful: ${result['message']}');
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
