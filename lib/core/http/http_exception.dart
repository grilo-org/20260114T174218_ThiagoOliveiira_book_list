import '../core.dart';

/// {@category Infra}
/// This [Exception] implementation provides a way to handle all kind of Izacore HTTP mapped errors with traceable parameters like [urlRequest] and response [message].
class CustomHttpException implements Exception {
  final HttpError httpError;
  final String message;

  const CustomHttpException({required this.httpError, required this.message});

  @override
  String toString() => "CustomHttpException(httpError: $httpError, message: $message)";
}
