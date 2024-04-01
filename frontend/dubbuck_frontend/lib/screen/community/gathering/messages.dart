// class Messages extends StatelessWidget {
//   const Messages(
//       {super.key,
//         required this.messages,
//         required this.userId,
//       });
//
//   final List<Message> messages;
//   final String userId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
//         child: ListView.builder(
//           reverse: true,
//           itemCount: messages.length,
//           itemBuilder: (context, index) {
//             return ChatBubbles(
//                 messages[index], messages[index].sender == userId);
//           },
//         ));
//   }
// }