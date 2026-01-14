import 'package:book_list/features/books/data/data.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data.dart';

void main() {
  late BooksRemoteDatasourceImpl sut;
  late String url;
  late HttpClientSpy httpClient;
  late List<Map> books;

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();

    sut = BooksRemoteDatasourceImpl(client: httpClient, url: url);

    books = ApiFactory.makeBooksJson();
    httpClient.mockRequest(books);
  });

  group('fetchBooks', () {
    test('Should call HttpClient for fetchBooks with correct values', () async {
      await sut.fetchBooks();

      verify(() => httpClient.request(url: url));
    });

    test('Should return an List with correct values', () async {
      final result = await sut.fetchBooks();

      expect(result, books.map((json) => BookModel.fromJson(json).toEntity()).toList());
    });

    test('Should return an List with query', () async {
      final result = await sut.fetchBooks(query: faker.lorem.word());

      expect(result, books.map((json) => BookModel.fromJson(json).toEntity()).toList());
    });
  });
}
