// class ChatRoom {
//   String chatRoomId;
//   ChatMember writer;
//   ChatMember contact;
//   List<Message> messages;
//
//   ChatRoom({
//     required this.chatRoomId,
//     required this.writer,
//     required this.contact,
//     required this.messages,
//   });
//
//   factory ChatRoom.fromJson(Map<dynamic, dynamic> json) {
//     return ChatRoom(
//         chatRoomId: json['chatRoomId'],
//         writer: json['writer'].map((writer) => ChatMember.fromJson(writer)),
//     contact: json['contact'].map((contact) => ChatMember.fromJson(contact)),
//     messages: json['messages']
//         .map((message) => Message.fromJson(message))
//         .toList(), // ChatRoom
//   }
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       'chatRoomId': chatRoomId,
//       'writer': writer.toJson(),
//       'contact': contact.toJson(),
//       'messages': messages.map((message) => message.toJson()).toList(),
//     };
//   }
//
//   factory ChatRoom.fromDocumentSnapshot(DocumentSnapshot snapshot) {
//     final List<Message> message = [];
//     final messagesSnapshot = List<Map>.from(snapshot['messages'] as List);
//     for (var e in messagesSnapshot) {
//       message.add(Message.fromJson(e as Map<String, dynamic>));
//   }
//   return ChatRoom(
//       chatRoomId: snapshot['chatRoomId'],
//       writer:
//         ChatMember.fromJson(snapshot['writer'] as Map<String, dynamic>),
//       contact: ChatMember.fromJson(snapshot['contact'] as Map<String, dynamic>),
//       messages: message,); // ChatRoom
//   }
// }
