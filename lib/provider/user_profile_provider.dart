import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileProvider with ChangeNotifier {
  File? _profileImage;
  String? _username;
  String? _introduction;
  static const _introKey = 'userIntroduction';
  static const _usernameKey = 'username';

  File? get profileImage => _profileImage;
  String? get username => _username;
  String? get introduction => _introduction;

  void setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
    _username = username;
    notifyListeners();
  }

  Future<void> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_usernameKey);
    notifyListeners();
  }

  void setIntroduction(String intro) async {
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
    notifyListeners();
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setProfileImage(File(image.path));
    }
  }
}
