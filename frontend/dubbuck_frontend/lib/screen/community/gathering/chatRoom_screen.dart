// class ChatScreen extends StatefulWidget {
//   const ChatScreen(
//       {super.key,
//         required this.chatroomId,
//       });
//
//   final String chatroomId;
//
//   @override
//   ChatScreenState createState() => ChatScreenState();
// }
//
// class ChatScreenState extends State<ChatScreen> {
//   final _controller = TextEditingController();
//   String newMessage = '';
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus(); // 키보드 닫기 이벤트
//         },
//         child: Scaffold(
//             appBar: AppBar(
//               toolbarHeight: MediaQuery.of(context).size.height * 0.12,
//               backgroundColor: Color.fromARGB(255, 42, 42, 42),
//               title: GestureDetector(
//                 onTap: () => onProfilePressed(context, widget.counselor),
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           ProfileImage(
//                             onProfileImagePressed: () =>
//                                 onProfilePressed(context, widget.counselor),
//                             isChoosedPicture: false,
//                             path: widget.counselor.profileUrl,
//                             type: 1,
//                             imageSize:
//                             MediaQuery.of(context).size.height * 0.07,
//                           ),
//                           const SizedBox(width: 20),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.45,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(widget.counselor.name,
//                                     style: const TextStyle(
//                                         color: Palette.appColor,
//                                         fontSize: 23,
//                                         fontWeight: FontWeight.bold)),
//                                 Text(widget.counselor.address,
//                                     style: const TextStyle(
//                                         color: Palette.appColor,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w400)),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: const [
//                           Icon(
//                             Icons.arrow_right,
//                             color: Palette.appColor,
//                           ),
//                         ],
//                       )
//                     ]),
//               ),
//               centerTitle: true,
//               elevation: 0,
//             ),
//             backgroundColor: Color.fromARGB(255, 42, 42, 42),
//             extendBodyBehindAppBar: false,
//             body: Stack(
//               children: [
//                 Container(
//                     decoration: const BoxDecoration(
//                       color: Palette.appColor,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         Expanded(
//                             child: StreamBuilder(
//                               stream:
//                               ChatService().getChatRoomData(widget.chatroomId),
//                               builder: (context, snapshot) {
//                                 if (snapshot.hasData) {
//                                   return Messages(
//                                       messages:
//                                       snapshot.data!.messages.reversed.toList(),
//                                       userId: userId,
//                                       counselor: widget.counselor);
//                                 } else {
//                                   return const Center(
//                                     child: Text('sendMessage'),
//                                   );
//                                 }
//                               },
//                             )),
//                         sendMesssage()
//                       ],
//                     ))
//               ],
//             )));
//   }
//
//   Widget sendMesssage() => Container(
//       height: MediaQuery.of(context).size.height * 0.07,
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: Color.fromARGB(18, 0, 0, 0), blurRadius: 10)
//         ],
//         color: Palette.appColor,
//       ),
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: Row(children: [
//         IconButton(
//           padding: EdgeInsets.zero,
//           onPressed: onSendImagePressed,
//           icon: const Icon(Icons.camera_alt),
//           color: Colors.blue,
//           iconSize: 25,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//             child: TextField(
//               maxLines: null,
//               keyboardType: TextInputType.multiline,
//               textCapitalization: TextCapitalization.sentences,
//               controller: _controller,
//               decoration: InputDecoration(
//                 suffixIcon: IconButton(
//                   onPressed: onSendMessage,
//                   icon: const Icon(Icons.send),
//                   color: Colors.blue,
//                   iconSize: 25,
//                 ),
//                 hintText: "Type your message here",
//                 hintMaxLines: 1,
//                 contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
//                 hintStyle: const TextStyle(
//                   fontSize: 16,
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(
//                     color: Colors.white,
//                     width: 0.2,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: const BorderSide(
//                     color: Colors.black26,
//                     width: 0.2,
//                   ),
//                 ),
//               ),
//               onChanged: (value) {
//                 newMessage = value;
//               },
//             )),
//       ]));