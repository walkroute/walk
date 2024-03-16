import 'package:flutter/material.dart';
import '../registartion/registration_screen.dart';
import 'app_title.dart';
import '../../component/login_and_registration/email_text_field.dart';
import '../../component/login_and_registration/password_text_field.dart';
import '../../component/login_and_registration/forgot_password_button.dart';
import '../../component/login_and_registration/login_button.dart';
import '../../component/login_and_registration/registration_button.dart';
import '../forgot/forgotPassword_screen.dart';
import '../main/main_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _validateEmail(String email) {
    return true;
    // 실제 이메일 유효성 검사 로직
    // return RegExp(r'\S+@\S+\.\S+').hasMatch(email);
  }

  bool _validatePassword(String password) {
    return true;
    // 실제 비밀번호 유효성 검사 로직
    // return password.length >= 8;
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (_validateEmail(email) && _validatePassword(password)) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => MainPage()));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('오류'),
          content: Text('유효한 이메일과 비밀번호를 입력해주세요.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            EmailTextField(controller: _emailController),
            SizedBox(height: 16),
            PasswordTextField(controller: _passwordController),
            SizedBox(height: 24),
            LoginButton(onValidated: _login),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ForgotPasswordButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  }),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: RegistrationButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}