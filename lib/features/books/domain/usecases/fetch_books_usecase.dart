import '../domain.dart';

class FetchBooksUsecase {
  final BooksRepository repo;

  FetchBooksUsecase({required this.repo});

  Future<List<BookEntity>> call({String? query}) {
    return repo.fetchBooks(query: query);
  }
}
