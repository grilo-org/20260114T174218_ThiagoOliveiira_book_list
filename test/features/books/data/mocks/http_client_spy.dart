import 'package:book_list/core/core.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall({String? url}) => when(
    () => request(
      url: url ?? any(named: 'url'),
      headers: any(named: 'headers'),
      query: any(named: 'query'),
    ),
  );
  void mockRequest(dynamic data, {String? url}) => mockRequestCall(url: url).thenAnswer((_) async => data);
  void mockRequestError(CustomHttpException error) => mockRequestCall().thenThrow(error);
}
