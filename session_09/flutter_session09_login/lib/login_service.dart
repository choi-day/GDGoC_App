import 'package:dio/dio.dart';

import 'package:flutter_session09_login/const_dio.dart';

class LoginService {
  final Dio dio;

  LoginService({Dio? dio}) : dio = dio ?? Dio(); // dio를 선택적으로 전달하거나 기본값으로 초기화

  Future<bool> login(String username, String password) async {
    try {
      final response = await dio.post(
        '$BASE_URL/auth/login',
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true; // 로그인 성공 여부만 반환
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // 서버에서 반환된 오류 처리
        throw Exception(e.response?.data['message'] ?? 'Unknown error');
      } else {
        // 네트워크 오류 또는 기타 오류 처리
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
