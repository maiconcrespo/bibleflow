import 'package:bibleflow/src/ui/book_list.dart';
import 'package:flutter/material.dart';

class BibleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: BookList(),
      ),
    );
  }
}
