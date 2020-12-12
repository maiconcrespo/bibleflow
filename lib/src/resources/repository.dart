import 'dart:async';
import 'package:bibleflow/src/models/book_model.dart';

import 'bible_api_provider.dart';
import '../models/bible_model.dart';

class Repository {
  final bibleApiProvider = BibleApiProvider();
  final bookApiProvider = BookApiProvider();

  Future<BibleModel> fetchAllBibles() => bibleApiProvider.fetchBibleModelList();

  Future<BookModel> fetchAllBooks() => bookApiProvider.fetchBookModelList();
}
