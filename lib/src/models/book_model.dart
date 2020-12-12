// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    this.books,
  });

  List<Book> books;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  Book({
    this.passage,
    this.chapters,
  });

  String passage;
  List<Chapter> chapters;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        passage: json["passage"],
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "passage": passage,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  Chapter({
    this.passage,
  });

  String passage;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        passage: json["passage"],
      );

  Map<String, dynamic> toJson() => {
        "passage": passage,
      };
}
