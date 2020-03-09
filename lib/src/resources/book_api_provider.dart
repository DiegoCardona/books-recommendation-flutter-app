import 'dart:async';
import 'dart:convert';
import '../models/book_model.dart';
import 'package:http/http.dart' as http;
import 'package:book_recommender/env.dart';

class BookApiProvider {
  var endpoint = environment['booksUrl'];
  final key = environment['credentialsBooksAPI'];

  Future<BooksListModel> fetchBooksList(String author) async {
    var httpClient = http.Client();
    try {
      final response = await httpClient.get(endpoint + author + key);

      if (response.statusCode == 200) {
        return BooksListModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Book');
      }
    } finally {
      httpClient.close();
    }
  }
}