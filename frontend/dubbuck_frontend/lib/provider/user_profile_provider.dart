import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileProvider with ChangeNotifier {
  File? _profileImage;
  String? _nickname;
  String? _introduction;
  static const _introKey = 'userIntroduction';
  static const _nicknameKey = 'nickname';
  static const _profileImagePathKey = 'profileImagePath';

  File? get profileImage => _profileImage;
  String? get nickname => _nickname;
  String? get introduction => _introduction;

  Future<void> setNickname(String nickname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nicknameKey, nickname);
    _nickname = nickname;
    notifyListeners();
  }

  Future<void> loadNickname() async {
    final prefs = await SharedPreferences.getInstance();
    _nickname = prefs.getString(_nicknameKey);
    notifyListeners();
  }

  Future<void> setIntroduction(String intro) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_introKey, intro);
    _introduction = intro;
    notifyListeners();
  }

  Future<void> loadIntroduction() async {
    final prefs = await SharedPreferences.getInstance();
    _introduction = prefs.getString(_introKey);
    notifyListeners();
  }

  Future<void> setProfileImage(File image) async {
    _profileImage = image;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileImagePathKey, image.path); // 이미지 파일 경로 저장
    notifyListeners();
  }

  Future<void> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString(_profileImagePathKey);
    if (imagePath != null) {
      _profileImage = File(imagePath);
      notifyListeners();
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await setProfileImage(File(image.path));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nicknameKey);
    await prefs.remove(_introKey);
    await prefs.remove(_profileImagePathKey); // 이미지 경로 정보 삭제

    _nickname = null;
    _introduction = null;
    _profileImage = null;
    notifyListeners();
  }
}
