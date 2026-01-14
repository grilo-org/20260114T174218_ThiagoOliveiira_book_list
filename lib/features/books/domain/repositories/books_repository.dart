import '../entities/entities.dart';

abstract class BooksRepository {
  Future<List<BookEntity>> fetchBooks({String? query});
}
