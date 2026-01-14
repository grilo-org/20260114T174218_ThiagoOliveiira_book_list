import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class BooksRepositoryImpl with HandleDomainException implements BooksRepository {
  final BooksRemoteDatasource datasource;

  BooksRepositoryImpl({required this.datasource});

  @override
  Future<List<BookEntity>> fetchBooks({String? query}) async {
    try {
      final request = await datasource.fetchBooks(query: query);

      return request;
    } on CustomHttpException catch (error) {
      throw handleHttpException(error.httpError, error.message);
    }
  }
}
