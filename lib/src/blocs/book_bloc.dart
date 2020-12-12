import 'package:bibleflow/src/models/book_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class BooksBloc {
  final _repository = Repository();
  final _booksFetcher = PublishSubject<BookModel>();

  Observable<BookModel> get allBooks => _booksFetcher.stream;

  fetchAllBook() async {
    BookModel bookModel = await _repository.fetchAllBooks();
    _booksFetcher.sink.add(bookModel);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bloc = BooksBloc();
