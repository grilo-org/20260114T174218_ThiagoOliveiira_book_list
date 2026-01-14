import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class BooksRemoteDatasource {
  Future<List<BookEntity>> fetchBooks({String? query});
}

class BooksRemoteDatasourceImpl implements BooksRemoteDatasource {
  final HttpClient client;
  final String url;

  BooksRemoteDatasourceImpl({required this.client, required this.url});

  @override
  Future<List<BookEntity>> fetchBooks({String? query}) async {
    final queryParameters = query != null ? {'title': query} : null;
    final response = await client.request(url: url, query: queryParameters);

    return response.map<BookEntity>((json) => BookModel.fromJson(json).toEntity()).toList();
  }
}
