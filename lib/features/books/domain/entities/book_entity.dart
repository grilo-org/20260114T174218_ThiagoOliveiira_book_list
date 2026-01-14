import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  const BookEntity({required this.id, required this.title, required this.author, required this.year, required this.publisher});

  final String id;
  final String title;
  final String author;
  final String year;
  final String publisher;

  @override
  List get props => [id, title, author, year, publisher];
}
