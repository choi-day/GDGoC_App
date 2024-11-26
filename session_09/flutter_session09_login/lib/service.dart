// import 'package:dio/dio.dart';

// class AuthService {
//   final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com/api'));

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       Response response = await _dio.post('/login', data: {
//         'email': email,
//         'password': password,
//       });
//       return response.data;
//     } catch (e) {
//       throw Exception('Login failed: ${e.toString()}');
//     }
//   }

//   Future<Map<String, dynamic>> signup(String email, String password) async {
//     try {
//       Response response = await _dio.post('/signup', data: {
//         'email': email,
//         'password': password,
//       });
//       return response.data;
//     } catch (e) {
//       throw Exception('Signup failed: ${e.toString()}');
//     }
//   }
// }
