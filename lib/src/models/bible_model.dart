//https://api.biblia.com/v1/bible/content/{bible}.{outputFormat}?passage={bibleReference}&key=
//{API key}"8befdc07b0d85f4e5129de931e3ddd25"
// To parse this JSON data, do
//
//     final bibleModel = bibleModelFromJson(jsonString);

import 'dart:convert';

BibleModel bibleModelFromJson(String str) =>
    BibleModel.fromJson(json.decode(str));

String bibleModelToJson(BibleModel data) => json.encode(data.toJson());

class BibleModel {
  BibleModel({
    this.bibles,
  });

  List<Bible> bibles;

  factory BibleModel.fromJson(Map<String, dynamic> json) => BibleModel(
        bibles: List<Bible>.from(json["bibles"].map((x) => Bible.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bibles": List<dynamic>.from(bibles.map((x) => x.toJson())),
      };
}

class Bible {
  Bible({
    this.bible,
    this.title,
    this.abbreviatedTitle,
    this.publicationDate,
    this.languages,
    this.publishers,
    this.imageUrl,
    this.description,
    this.searchFields,
    this.copyright,
    this.extendedCopyright,
  });

  String bible;
  String title;
  String abbreviatedTitle;
  String publicationDate;
  List<String> languages;
  List<String> publishers;
  String imageUrl;
  String description;
  List<String> searchFields;
  String copyright;
  String extendedCopyright;

  factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        bible: json["bible"],
        title: json["title"],
        abbreviatedTitle: json["abbreviatedTitle"],
        publicationDate: json["publicationDate"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        publishers: List<String>.from(json["publishers"].map((x) => x)),
        imageUrl: json["imageUrl"],
        description: json["description"],
        searchFields: List<String>.from(json["searchFields"].map((x) => x)),
        copyright: json["copyright"],
        extendedCopyright: json["extendedCopyright"],
      );

  Map<String, dynamic> toJson() => {
        "bible": bible,
        "title": title,
        "abbreviatedTitle": abbreviatedTitle,
        "publicationDate": publicationDate,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "publishers": List<dynamic>.from(publishers.map((x) => x)),
        "imageUrl": imageUrl,
        "description": description,
        "searchFields": List<dynamic>.from(searchFields.map((x) => x)),
        "copyright": copyright,
        "extendedCopyright": extendedCopyright,
      };
}
