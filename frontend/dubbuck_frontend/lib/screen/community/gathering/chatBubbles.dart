// class ChatBubbles extends StatelessWidget {
//   const ChatBubbles(this.message, this.isMe, {Key? key})
//       : super(key: key);
//
//   final Message message;
//   final bool isMe;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment:
//         isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (isMe) ...{
//
//             Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(dataTimeFormat(message.createdAt),
//                           style: TextStyles.shadowTextStyle),
//                       BubbleSpecialOne(
//                           text: message.content,
//                           isSender: true,
//                           color: Colors.blue,
//                           textStyle: TextStyles.blueBottonTextStyle),
//                     ]))
//
//           },
//           if (!isMe)
//             Padding(
//                 padding: const EdgeInsets.only(bottom: 15),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ProfileButton(
//                           nickname: counselor.name,
//                           path: counselor.profileUrl,
//                           onProfilePressed: onProfilePressed),
//                       Padding(
//                           padding: const EdgeInsets.only(left: 40),
//                           child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 BubbleSpecialOne(
//                                   text: message.content,
//                                   isSender: false,
//                                   color: Palette.appColor2.withOpacity(0.3),
//                                   textStyle:
//                                   TextStyles.chatNotMeBubbleTextStyle,
//                                 ),
//                                 Text(dataTimeFormat(message.createdAt),
//                                     style: TextStyles.shadowTextStyle),
//                               ]))
//                     ]))
//         ]);
//   }