import 'package:book_list/core/http/http_exception.dart';
import 'package:book_list/features/books/data/datasource/books_remote_datasource.dart';
import 'package:book_list/features/features.dart';
import 'package:mocktail/mocktail.dart';

class BooksRemoteDatasourceSpy extends Mock implements BooksRemoteDatasource {
  When _mockFetchBooksCall() => when(() => fetchBooks());

  void mockFetchBooks(List<BookEntity> data) => _mockFetchBooksCall().thenAnswer((_) async => data);

  void mockFetchError(CustomHttpException error, {String? query}) => _mockFetchBooksCall().thenThrow(error);
}
