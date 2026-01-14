import '../core.dart';

class CustomDomainException implements Exception {
  final DomainError domainError;

  @override
  String toString() => "CustomDomainException(domainError: $domainError)";

  const CustomDomainException({required this.domainError});
}
