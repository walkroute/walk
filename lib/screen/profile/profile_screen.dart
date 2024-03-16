import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../main/main_screen.dart';
import '../../provider/user_profile_provider.dart';
import 'full_screen_image_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfileScreen> {
  final TextEditingController _introController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
    _introController.text = Provider.of<UserProfileProvider>(context, listen: false).introduction ?? '');
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Provider.of<UserProfileProvider>(context, listen: false).setProfileImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 설정'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              if (userProfileProvider.profileImage != null) {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return FullScreenImagePage(
                    imageProvider: FileImage(userProfileProvider.profileImage!),
                  );
                }));
              }
            },
            child: Hero(
              tag: 'profileImage',
              child: CircleAvatar(
                radius: 80,
                backgroundImage: userProfileProvider.profileImage != null ? FileImage(userProfileProvider.profileImage!) : null,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: FloatingActionButton(
                          onPressed: _pickImage,
                          child: Icon(Icons.camera_alt, size: 30),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _introController,
                      decoration: InputDecoration(
                        labelText: '소개',
                        hintText: '본인 소개를 입력하세요.',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => userProfileProvider.setIntroduction(value),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      width: double.infinity, // 컨테이너를 화면 너비에 맞춤
                      child: ElevatedButton(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, // 텍스트 색상
                          backgroundColor: Colors.blue, // 배경 색상
                          padding: EdgeInsets.symmetric(vertical: 12), // 버튼 내부 상하 패딩 조정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // 버튼 모서리 둥글기
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
