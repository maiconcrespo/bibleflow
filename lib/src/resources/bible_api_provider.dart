//{API key}"8befdc07b0d85f4e5129de931e3ddd25" bibleflow
// "Content"	Returns the content of a Bible.
//https://api.biblia.com/v1/bible/content/{bible}.{outputFormat}?passage={bibleReference}&key={API key}
// Example "https://api.biblia.com/v1/bible/content/LEB.json?passage=John3.16&key=8befdc07b0d85f4e5129de931e3ddd25"

// "Table of Contents"	Returns the table of contents of a Bible.
//http://api.biblia.com/v1/bible/contents/{bible}
// Example"https://api.biblia.com/v1/bible/contents/RVR60?key=8befdc07b0d85f4e5129de931e3ddd25"

// "Search"	Searches the text of a Bible, optionally using a “fuzzy search” algorithm.
//https://api.biblia.com/v1/bible/search/{bible}?query={query}
//Example "https://api.biblia.com/v1/bible/search/RVR60.js?query=bread&mode=verse&start=0&limit=20&key=abc123"

// "Find"	Finds one or more Bibles and provides Bible metadata.
//https://api.biblia.com/v1/bible/find/{bible}
//https://api.biblia.com/v1/bible/find?query={query}
//Example "https://api.biblia.com/v1/bible/find?query=lexham&key=abc123

//"https://api.biblia.com/v1/bible/find/leb.json?key=abc123

//The following request will return all available Bibles.

//"https://api.biblia.com/v1/bible/find?key=abc123

// "Image"	Returns the cover image for a Bible.
//https://api.biblia.com/v1/bible/image/{bible}
//Example "https://api.biblia.com/v1/bible/image/LEB?key=abc123"

// "Parse"	Parses the specified text as one or more Bible passages. Can also be used to render a Bible reference in short, medium, or long form.
//https://api.biblia.com/v1/bible/parse
//Example
//"https://api.biblia.com/v1/bible/parse?passage=2+Kgs+3-4&key=123abc

//https://api.biblia.com/v1/bible/parse?passage=2+Kgs+1-2,+4-5&key=123abc

// "Scan"	Scans the specified text for Bible references.
//https://api.biblia.com/v1/bible/scan/?text={text}&tagChapters={bool}
//Example "https://api.biblia.com/v1/bible/scan?text=Look+at+Gen+1:1&key=abc123

// "Tag"	Tags the specified text with Bible references.
//Example "https://api.biblia.com/v1/bible/tag?text=Look+up+Gen+3%3a4&tagChapters={bool}

// "Compare"	Compares two Bible references.
//https://api.biblia.com/v1/bible/compare?first={bible reference}&second={bible reference}
//Example "https://api.biblia.com/v1/bible/compare?first=Ge+3:4&second=Ge+3:1-10&key=abc123

import 'dart:async';
import 'package:bibleflow/src/models/book_model.dart';
import 'package:http/http.dart' show Client;

import '../models/bible_model.dart';

final _apiKey = '8befdc07b0d85f4e5129de931e3ddd25';

/// aqui llega la entrada de usuario de toda la app

class BibleApiProvider {
  Client client = Client();
  //final _apiKey = '8befdc07b0d85f4e5129de931e3ddd25';

  Future<BibleModel> fetchBibleModelList() async {
    print("entered");
    final response =
        await client.get("https://api.biblia.com/v1/bible/find?key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      final bibleModel = bibleModelFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return bibleModel;
      //return( BibleModel.fromJson(json.decode(response.body)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

class BookApiProvider {
  Client client = Client();

  Future<BookModel> fetchBookModelList() async {
    print("entered");
    final response = await client
        .get("https://api.biblia.com/v1/bible/contents/RVR60?key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      final bookModel = bookModelFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return bookModel;
      //return( BibleModel.fromJson(json.decode(response.body)));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

// class VerseApiProvider {
//   Client client = Client();
//   final _apiKey = '8befdc07b0d85f4e5129de931e3ddd25';

//   Future<VerseModel> fetchVerseModelList() async {
//     print("entered");
//     final response =
//         await client.get("https://api.biblia.com/v1/bible/find?key=$_apiKey");
//     print(response.body.toString());
//     if (response.statusCode == 200) {
//       final verseModel = bibleVerseFromJson(response.body);
//       // If the call to the server was successful, parse the JSON
//       return verseModel;
//       //return( BibleModel.fromJson(json.decode(response.body)));
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load post');
//     }
//   }
// }

// class ChapterApiProvider {
//   Client client = Client();
//   final _apiKey = '8befdc07b0d85f4e5129de931e3ddd25';

//   Future<ChapterModel> fetchChapterModelList() async {
//     print("entered");
//     final response =
//         await client.get("https://api.biblia.com/v1/bible/find?key=$_apiKey");
//     print(response.body.toString());
//     if (response.statusCode == 200) {
//       final chapterModel = chapterModelFromJson(response.body);
//       // If the call to the server was successful, parse the JSON
//       return chapterModel;
//       //return( BibleModel.fromJson(json.decode(response.body)));
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load post');
//     }
//   }
// }
