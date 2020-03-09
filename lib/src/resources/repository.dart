import 'dart:async';
import 'book_api_provider.dart';
import '../models/book_model.dart';

class Repository {
  final booksApiProvider = BookApiProvider();

  Future<BooksListModel> fetchBooksByAuthor(author) => booksApiProvider.fetchBooksList(author);
}