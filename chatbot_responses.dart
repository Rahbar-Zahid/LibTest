// // chatbot_responses.dart
//
// class ChatbotState {
//   String? currentQuestion;
//   Map<String, String>? userResponses;
//
//   ChatbotState({this.currentQuestion, this.userResponses});
// }
// // chatbot_responses.dart
// // chatbot_responses.dart
//
// class ChatbotState {
//   String? currentQuestion;
//   Map<String, String>? userResponses;
//
//   ChatbotState({this.currentQuestion, this.userResponses});
// }
//
// String getResponse(String message, ChatbotState? state) {
//   final lowerCaseMessage = message.toLowerCase();
//
//   // Handle different states or questions
//   if (state != null && state.currentQuestion != null) {
//     if (state.currentQuestion == 'Which product are you interested in?') {
//       if (lowerCaseMessage.contains('surveillance')) {
//         return 'We have various surveillance products. Are you interested in cameras, drones, or something else?';
//       } else if (lowerCaseMessage.contains('lfr') || lowerCaseMessage.contains('ltdr')) {
//         return 'LFR & LTDR products include apparel. Do you have a specific item in mind?';
//       } else if (lowerCaseMessage.contains('tank') || lowerCaseMessage.contains('apc')) {
//         return 'Tank/APC Sights include various optics. What type of sight are you interested in?';
//       } else if (lowerCaseMessage.contains('weapon')) {
//         return 'Weapon sights are available for different firearms. Do you need details on a specific model?';
//       } else {
//         return 'I’m not sure what you are referring to. Can you provide more details?';
//       }
//     } else if (state.currentQuestion == 'What issue are you facing?') {
//       if (lowerCaseMessage.contains('technical')) {
//         return 'For technical issues, please describe the problem you are experiencing.';
//       } else if (lowerCaseMessage.contains('billing')) {
//         return 'For billing issues, please provide your order number and describe the problem.';
//       } else if (lowerCaseMessage.contains('general')) {
//         return 'For general inquiries, please provide more details about your question.';
//       } else {
//         return 'I’m not sure how to respond to that. Could you please provide more details?';
//       }
//     } else {
//       return 'I’m not sure how to respond to that. Could you please provide more details or ask something else?';
//     }
//   }
//
//   // Initial questions
//   if (lowerCaseMessage.contains('product')) {
//     return 'Which product are you interested in?';
//   } else if (lowerCaseMessage.contains('support')) {
//     return 'What issue are you facing?';
//   } else {
//     return 'I’m not sure how to respond to that. Could you please provide more details or ask something else?';
//   }
// }
