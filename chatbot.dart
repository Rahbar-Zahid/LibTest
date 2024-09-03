// import 'package:flutter/material.dart';
// import 'chatbot_responses.dart';  // Import the updated responses file
//
// class ChatbotWidget extends StatefulWidget {
//   const ChatbotWidget({super.key});
//
//   @override
//   _ChatbotWidgetState createState() => _ChatbotWidgetState();
// }
//
// class _ChatbotWidgetState extends State<ChatbotWidget> {
//   final List<Map<String, String>> _messages = [
//     {'bot': 'Hi, If you have a question about anything, Ask it Out!'}
//   ];
//   final TextEditingController _controller = TextEditingController();
//   ChatbotState? _state;
//
//   void _sendMessage() {
//     final message = _controller.text.trim();
//     if (message.isNotEmpty) {
//       setState(() {
//         _messages.add({'user': message});
//         _controller.clear();
//         final response = getResponse(message, _state);
//         _messages.add({'bot': response});
//         // Update the state if necessary
//         _updateState(message, response);
//       });
//     }
//   }
//
//   void _updateState(String message, String response) {
//     if (response.contains('What type of product are you interested in?')) {
//       _state = ChatbotState(
//         currentQuestion: 'What type of product are you interested in?',
//         userResponses: {'product': message},
//       );
//     } else if (response.contains('What issue are you facing?')) {
//       _state = ChatbotState(
//         currentQuestion: 'What issue are you facing?',
//         userResponses: {'support': message},
//       );
//     } else {
//       _state = null;  // Reset state if no more questions are needed
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Ask Your Query',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             reverse: false,
//             itemCount: _messages.length,
//             itemBuilder: (context, index) {
//               final message = _messages[index];
//               final isUserMessage = message.containsKey('user');
//               return ListTile(
//                 title: Align(
//                   alignment: isUserMessage
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       color: isUserMessage ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       message.values.first,
//                       style: TextStyle(
//                         color: isUserMessage ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _controller,
//                   decoration: const InputDecoration(
//                     hintText: 'Type your query...',
//                     border: OutlineInputBorder(),
//                   ),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.send),
//                 onPressed: _sendMessage,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }