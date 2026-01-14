import 'package:book_list/core/core.dart';
import 'package:book_list/features/books/book.dart';
import 'package:book_list/features/books/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/domain_error_type.dart';
import '../mocks/book_remote_data_source_spy.dart';

class BookEntityFake extends Fake implements BookEntity {}

void main() {
  late BooksRepositoryImpl sut;
  late BooksRemoteDatasourceSpy datasource;

  setUpAll(() {
    registerFallbackValue('');
  });

  setUp(() {
    datasource = BooksRemoteDatasourceSpy();
    sut = BooksRepositoryImpl(datasource: datasource);

    datasource.mockFetchBooks(const <BookEntity>[]);
  });

  test('Should return datasource without query', () async {
    await sut.fetchBooks();

    verify(() => datasource.fetchBooks(query: null)).called(1);
  });

  test('Should return equals list of datasource', () async {
    final items = <BookEntity>[BookEntityFake(), BookEntityFake()];
    datasource.mockFetchBooks(items);

    final result = await sut.fetchBooks();

    expect(result, same(items));
  });

  test('Should throws Unexpected if fetchBooks returns ServerError', () async {
    datasource.mockFetchError(CustomHttpException(httpError: HttpError.serverError, message: ''));
    final result = sut.fetchBooks();

    expect(result, throwsA(DomainErrorsHandler.domainErrorType(DomainError.unexpected)));
  });

  test('Should throws NotFound if fetchBooks returns NotFound', () async {
    datasource.mockFetchError(CustomHttpException(httpError: HttpError.notFound, message: ''));
    final result = sut.fetchBooks();

    expect(result, throwsA(DomainErrorsHandler.domainErrorType(DomainError.notFound)));
  });

  test('Should throws BadRequest if fetchBooks returns Unexpected', () async {
    datasource.mockFetchError(CustomHttpException(httpError: HttpError.badRequest, message: ''));
    final result = sut.fetchBooks();

    expect(result, throwsA(DomainErrorsHandler.domainErrorType(DomainError.unexpected)));
  });
}
