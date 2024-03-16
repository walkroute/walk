import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main/main_screen.dart';
import '../../component/login_and_registration/password_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  // 새 비밀번호와 새 비밀번호 확인을 위한 TextEditingControllers를 생성합니다.
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
      child: Scaffold(
        appBar: AppBar(
          title: Text('뚜벅뚜벅'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  '새로운 비밀번호를 설정하세요',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                PasswordTextField(
                  controller: _newPasswordController,
                  labelText: '새 비밀번호', // 수정된 라벨 텍스트
                  hintText: '새 비밀번호를 입력하세요', // 수정된 힌트 텍스트
                ),
                SizedBox(height: 20),
                PasswordTextField(
                  controller: _confirmNewPasswordController,
                  labelText: '새 비밀번호 확인', // 수정된 라벨 텍스트
                  hintText: '새 비밀번호를 다시 입력하세요', // 수정된 힌트 텍스트
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  child: Text('완료'),
                  onPressed: () {
                    // 여기서 비밀번호 유효성 검사 및 일치 여부를 확인할 수 있습니다.
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
