import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/book_model.dart';

class BooksBloc {
  final _repository = Repository();
  final _booksFetcher = PublishSubject<BooksListModel>();

  Observable<BooksListModel> get allBooks => _booksFetcher.stream;

  fetchAllBooks(String author) async {
    BooksListModel itemModel = await _repository.fetchBooksByAuthor(author);
    _booksFetcher.sink.add(itemModel);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bloc = BooksBloc();