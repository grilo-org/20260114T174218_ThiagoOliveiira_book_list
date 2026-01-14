abstract class HttpClient {
  Future<dynamic> request({required String url, Map<String, dynamic>? query, Map<String, String>? headers});
}
