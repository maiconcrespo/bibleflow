import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/bible_model.dart';

class BiblesBloc {
  final _repository = Repository();
  final _biblesFetcher = PublishSubject<BibleModel>();

  Observable<BibleModel> get allBibles => _biblesFetcher.stream;

  fetchAllBible() async {
    BibleModel bibleModel = await _repository.fetchAllBibles();
    _biblesFetcher.sink.add(bibleModel);
  }

  dispose() {
    _biblesFetcher.close();
  }
}

final bloc = BiblesBloc();
