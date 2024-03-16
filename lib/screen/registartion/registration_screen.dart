import 'package:flutter/material.dart';
import '../../component/login_and_registration/registration_confirm_button.dart';
import '../profile/profile_screen.dart';

import '../../component/login_and_registration/nickname_text_field.dart';
import '../../component/login_and_registration/email_text_field.dart';
import '../../component/login_and_registration/password_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register(BuildContext context) {
    String name = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    //
    // if (name.isEmpty || name.length < 2 || name.length > 10) {
    //   _showErrorDialog(context, "이름은 2~10자 이내여야 합니다.");
    //   return;
    // }
    //
    // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
    //   _showErrorDialog(context, "유효한 이메일 주소를 입력하세요.");
    //   return;
    // }
    //
    // if (password.isEmpty || password.length < 8) {
    //   _showErrorDialog(context, "비밀번호는 최소 8자 이상이어야 합니다.");
    //   return;
    // }

    // 모든 조건이 충족되면 ProfileScreen으로 이동
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("오류"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // 다이얼로그 닫기
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true, // "회원가입" 글자를 중앙에 정렬
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            NicknameTextField(controller: _nicknameController), // 별명 입력 필드
            SizedBox(height: 16),
            EmailTextField(controller: _emailController, labelText: '이메일', hintText: '이메일을 입력하세요.'), // 이메일 입력 필드
            SizedBox(height: 16),
            PasswordTextField(controller: _passwordController, labelText: '비밀번호', hintText: '비밀번호를 입력하세요.'), // 비밀번호 입력 필드
            SizedBox(height: 24),
            CustomButton(
              buttonText: '확인',
              onValidated: () => _register(context),
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ), // CustomButton 사
          ],
        ),
        ),
    );
  }
}