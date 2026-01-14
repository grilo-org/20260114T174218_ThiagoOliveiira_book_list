import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../../core/core.dart';

class HttpAdapter implements HttpClient {
  final Duration timeout;
  final Client _client;

  HttpAdapter({Client? client, Duration? timeout}) : _client = client ?? Client(), timeout = timeout ?? const Duration(seconds: 15);

  @override
  Future<dynamic> request({required String url, Map<String, dynamic>? query, Map<String, String>? headers}) async {
    Uri finalUrl = Uri();

    final hdrs = {'Accept': 'application/json'};

    if (query == null) {
      finalUrl = Uri.parse(url);
    } else {
      finalUrl = Uri.parse(url);
      finalUrl = Uri(host: finalUrl.host, scheme: finalUrl.scheme, path: finalUrl.path, queryParameters: query);
    }

    final resp = await _client.get(finalUrl, headers: hdrs).timeout(timeout);

    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return _handleResponse(resp, url);
    }

    throw _handleResponse(resp, url);
  }

  dynamic _handleResponse(Response response, String urlRequest) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body.isEmpty ? null : json.decode(response.body);
      case 204:
        return null;
      case 400:
        throw CustomHttpException(httpError: HttpError.badRequest, message: response.body);
      case 401:
        throw CustomHttpException(httpError: HttpError.unauthorized, message: response.body);
      case 403:
        throw CustomHttpException(httpError: HttpError.forbidden, message: response.body);
      case 404:
        throw CustomHttpException(httpError: HttpError.notFound, message: response.body);
      case 422:
        throw CustomHttpException(httpError: HttpError.unprocessable, message: response.body);
      default:
        throw CustomHttpException(httpError: HttpError.serverError, message: response.body);
    }
  }

  void close() => _client.close();
}
