// class BlogPost {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final String category;
//   final DateTime date;
//
//   BlogPost({
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.category,
//     required this.date,
//   });
//
//   // Factory method to create a BlogPost instance from a map
//   factory BlogPost.fromMap(Map<String, String> map) {
//     return BlogPost(
//       title: map['title']!,
//       description: map['description']!,
//       imageUrl: map['imageUrl']!,
//       category: map['category']!,
//       date: DateTime.parse(map['date']!),
//     );
//   }
//
//   // Method to convert a BlogPost instance to a map
//   Map<String, String> toMap() {
//     return {
//       'title': title,
//       'description': description,
//       'imageUrl': imageUrl,
//       'category': category,
//       'date': date.toIso8601String(),
//     };
//   }
// }
