import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../component/login_and_registration/email_text_field.dart';
import 'ResetPassword_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  bool _validateEmail(String email) {
    return true;
    // return RegExp(r'\S+@\S+\.\S+').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    void _resetPasswordPressed() {
      if (!_validateEmail(_emailController.text)) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('오류'),
            content: Text('유효한 이메일 주소를 입력해주세요.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('확인'),
              ),
            ],
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
        );
      }
    }

    return GestureDetector(
      onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
      child: Scaffold(
        appBar: AppBar(
          title: Text('뚜벅뚜벅'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  EmailTextField(controller: _emailController),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity, // 컨테이너를 화면 너비에 맞춤
                    child: ElevatedButton(
                      child: Text('비밀번호 재설정'),
                      onPressed: _resetPasswordPressed,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
