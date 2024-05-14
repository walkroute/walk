import 'package:cloud_firestore/cloud_firestore.dart';

import '../constant/firestore_constants.dart';

class UserInformation {
  final String id;
  final String photoUrl;
  final String nickname;
  final String aboutMe;

  const UserInformation({required this.id, required this.photoUrl, required this.nickname, required this.aboutMe});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserInformation.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (_) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (_) {}
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (_) {}
    return UserInformation(
      id: doc.id,
      photoUrl: photoUrl,
      nickname: nickname,
      aboutMe: aboutMe,
    );
  }
}
