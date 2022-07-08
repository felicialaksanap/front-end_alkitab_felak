// import 'dart:convert';

// import 'package:flutter/services.dart';
// import './book-model.dart';

// class BookServices {
//   static Future<List<BookModel>> getBookFromJSON() async {
//     try {
//       final result = 
//         jsonDecode(await rootBundle.loadString('assets/book.json')) as List;

//         return result.map((book) => BookModel.fromJSON(book)).toList();
//     } catch(e) {
//       throw Exception(e);
//     }
//   }
// }