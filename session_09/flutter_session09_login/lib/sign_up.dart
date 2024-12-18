import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// 회원가입에 관련된 로직과 화면을 담고 있는 파일
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final dio = Dio(); // api 통신을 위한 Dio 패키지 사용
  final _formKey = GlobalKey<FormState>(); // 입력 값을 받기 위한 private한 formkey 선언
  final TextEditingController nameController =
      TextEditingController(); // TextEditing controller 사용
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  void signup() async {
    // validation이 확실할 때
    if (_formKey.currentState!.validate()) {
      // 회원가입 API 요청
      final password = passwordController.text; // password 값
      final name = nameController.text; // name 값
      final response = await dio
          .post('https://api.labyrinth30-tech.link/auth/register', data: {
        'username': name,
        'password':
            password, // 해당 api로 post 요청을 넣음 (login처럼 const를 이용해, $BASE_URL 사용하는게 더 바람직)
      });
      // 상태 코드가 성공일 때
      if (response.statusCode == 200 || response.statusCode == 201) {
        // API 통신 후 적절한 사용자 피드백 (스낵바에 성공인지 실패인지 알려줌 )
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login unSuccessful')),
        );
      }
      // 성공 후 로그인 화면으로 이동
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup Successful! Please Login')),
      );
      Navigator.pop(context); // 로그인 화면으로 이동
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_add,
                            size: 100,
                            color: Color.fromARGB(255, 138, 112, 154)),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 3) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          //onPressed: signup
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
