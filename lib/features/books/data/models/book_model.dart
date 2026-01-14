import '../../domain/domain.dart';

class BookModel {
  const BookModel({required this.id, required this.title, required this.author, required this.year, required this.publisher});

  final String id;
  final String title;
  final String author;
  final String year;
  final String publisher;

  factory BookModel.fromJson(Map<dynamic, dynamic> json) {
    return BookModel(id: json['id'], title: json['title'], author: json['author'], year: json['published'], publisher: json['publisher']);
  }

  BookEntity toEntity() => BookEntity(id: id, title: title, author: author, year: year, publisher: publisher);
}
