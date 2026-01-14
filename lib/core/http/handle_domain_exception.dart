import '../core.dart';

mixin HandleDomainException {
  CustomDomainException handleHttpException(HttpError httpError, String message) {
    switch (httpError) {
      case HttpError.badRequest:
        return CustomDomainException(domainError: DomainError.unexpected);
      case HttpError.notFound:
        return CustomDomainException(domainError: DomainError.notFound);
      default:
        return CustomDomainException(domainError: DomainError.unexpected);
    }
  }
}
